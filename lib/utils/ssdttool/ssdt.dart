//  ssdt.dart
//  Created by JeoJay127
//
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:rapidssdt/extensions/string_extension.dart';
import 'package:rapidssdt/utils/ssdttool/dsdt.dart';
import 'package:rapidssdt/utils/ssdttool/parser.dart';
import 'package:rapidssdt/utils/ssdttool/util.dart';
import 'package:rapidssdt/utils/log/log.dart';
import 'config.dart';
import 'prebuilt.dart';
import 'run.dart';
import 'package:rapidssdt/l10n/l10n_helper.dart';
import 'package:path/path.dart' as path;

typedef _NativePnlfDevice = ({
  String tableName,
  Map<String, dynamic> table,
  List<dynamic> path,
});
typedef _IgpuPathResult = ({String path, bool guessed, bool manual});

class SSDT {
  final Run run = Run();
  final DSDT d;
  final Util util = Util();
  final targetIrqs = [0, 2, 8, 11];
  final illegalNames = ["XHC1", "EHC1", "EHC2", "PXSX"];
  final Map<String, List<String>> ssdtDependencies = const {
    "SSDT-SleepHook.aml": [
      "SSDT-LID.aml",
      "SSDT-FixShutdown.aml",
      "SSDT-WakeScreen.aml",
      "SSDT-LED.aml",
    ],
  };

  final String legacyWarning =
      l10nGlobal.msg_a1f078;

  AcpiConfig config;

  String outputFolder = 'Results';
  ACPIMatchMode? _lastACPIMatchMode = ACPIMatchMode.leastStrict;
  int _plistBatchDepth = 0;
  final Map<String, Map<String, dynamic>> _batchedPlists = {};

  /// 预制补丁
  final prePatches = [
    {
      "PrePatch": "GPP7 duplicate _PRW methods",
      "Comment": "GPP7._PRW to XPRW to fix Gigabyte's Mistake",
      "Find": "3708584847500A021406535245470214065350525701085F505257",
      "Replace": "3708584847500A0214065352454702140653505257010858505257",
    },
    {
      "PrePatch": "GPP7 duplicate UP00 devices",
      "Comment": "GPP7.UP00 to UPXX to fix Gigabyte's Mistake",
      "Find": "1047052F035F53425F50434930475050375B82450455503030",
      "Replace": "1047052F035F53425F50434930475050375B82450455505858",
    },
    {
      "PrePatch": "GPP6 duplicate _PRW methods",
      "Comment": "GPP6._PRW to XPRW to fix ASRock's Mistake",
      "Find": "47505036085F4144520C04000200140F5F505257",
      "Replace": "47505036085F4144520C04000200140F58505257",
    },
    {
      "PrePatch": "GPP1 duplicate PTXH devices",
      "Comment": "GPP1.PTXH to XTXH to fix MSI's Mistake",
      "Find": "50545848085F41445200140F",
      "Replace": "58545848085F41445200140F",
    },
  ];

  /// 构造函数
  /// [config] 配置
  SSDT({required this.config})
    : d = DSDT(
        useLocaliAsl: config.useLocaliAsl,
        useLeagcyiAsl: config.useLeagcyiAsl,
      );

  /// 转储表
  /// [filePath] 输入DSDT路径
  /// [disassemble] 是否反编译
  Future<String?> dumpTables(
    String filePath, {
    bool disassemble = false,
    Future<String?> Function()? onRequestSudoPassword,
  }) async => await d.dumpTables(
    filePath,
    disassemble: disassemble,
    onRequestSudoPassword: onRequestSudoPassword,
  );

  void checkIaslValid({bool? local, bool? legacy}) {
    if (local != null) {
      config = config.copyWith(useLocaliAsl: local);
      d.useLocaliAsl = local;
    }
    if (legacy != null) {
      config = config.copyWith(useLeagcyiAsl: legacy);
      d.useLeagcyiAsl = legacy;
    }
    d.acpiTool.checkIaslValid(local: local, legacy: legacy);
  }

  /// 自然排序
  /// [list] 待排序的字符串列表
  /// [first] 指定排到最前的名称
  List<String> sortedNicely(List<String> list, {String? first = "DSDT"}) {
    // 分割字符串为数字 / 非数字的序列
    List<dynamic> alphanumKey(String key) {
      final regex = RegExp(r'(\d+)');
      final parts = <dynamic>[];
      int lastIndex = 0;

      for (final match in regex.allMatches(key.toLowerCase())) {
        if (lastIndex < match.start) {
          parts.add(key.substring(lastIndex, match.start));
        }
        parts.add(int.parse(match.group(0)!));
        lastIndex = match.end;
      }
      if (lastIndex < key.length) {
        parts.add(key.substring(lastIndex));
      }
      return parts;
    }

    bool isFirst(String name) {
      if (first == null) return false;
      final lowerName = name.toLowerCase();
      final lowerFirst = first.toLowerCase();
      // 去掉后缀，仅比较表名
      final baseName = lowerName.split('.').first;
      return baseName == lowerFirst;
    }

    list.sort((a, b) {
      // 优先让 first 指定的表名排在最前
      final aIsFirst = isFirst(a);
      final bIsFirst = isFirst(b);

      if (aIsFirst && !bIsFirst) return -1;
      if (bIsFirst && !aIsFirst) return 1;

      // 其他项按自然排序
      final aKey = alphanumKey(a);
      final bKey = alphanumKey(b);

      for (int i = 0; i < aKey.length && i < bKey.length; i++) {
        final ax = aKey[i];
        final bx = bKey[i];

        if (ax is int && bx is int) {
          final cmp = ax.compareTo(bx);
          if (cmp != 0) return cmp;
        } else {
          final cmp = ax.toString().compareTo(bx.toString());
          if (cmp != 0) return cmp;
        }
      }
      return aKey.length.compareTo(bKey.length);
    });

    return list;
  }

  /// 从行中获取地址
  /// [line] 行号
  /// [splitBy] 分隔符
  /// [table] 表
  int? getAddressFromLine(
    int line, {
    String splitBy = '_ADR, ',
    Map<String, dynamic>? table,
  }) {
    // 如果未提供table，则获取 DSDT 或唯一表
    table ??= d.getDsdt();
    try {
      String rawLine = table?['lines'][line];
      String part = rawLine.split(splitBy)[1].split(')')[0];
      part = part
          .replaceAll('Zero', '0x0')
          .replaceAll('One', '0x1')
          .replaceFirst('0x', '');
      return int.parse(part, radix: 16);
    } catch (e) {
      debugPrint('Error Address : $e');
      return null;
    }
  }

  /// 获取 LPC 名称
  /// [skipEc] 是否跳过 EC 设备
  /// [skipCommonNames] 是否跳过常见名称
  String? getLpcName({bool skipEc = false, bool skipCommonNames = false}) {
    Log("In LPC(B)/SBRG...");

    for (final tableName in sortedNicely(d.acpiTables.keys.toList())) {
      final table = d.acpiTables[tableName]!;

      // 检查 EC 设备
      if (!skipEc) {
        final ecList = d.getDevicePathsWithHid(hid: "PNP0C09", table: table);
        if (ecList.isNotEmpty) {
          final lpcName = ecList[0][0]
              .split(".")
              .sublist(0, ecList[0][0].split(".").length - 1)
              .join(".");
          Log("=> In $tableName found $lpcName");
          return lpcName;
        }
      }

      // 检查常见名称
      if (!skipCommonNames) {
        for (final name in ["LPCB", "LPC0", "LPC", "SBRG", "PX40"]) {
          final paths = d.getDevicePaths(obj: name, table: table);
          if (paths.isNotEmpty && paths[0].isNotEmpty) {
            var lpcName = paths[0][0];
            Log("=> In $tableName found $lpcName");
            return lpcName;
          }
        }
      }

      // 检查地址
      final paths = d.getPathOfType(objType: "Name", obj: "_ADR", table: table);
      for (final path in paths) {
        final adr = getAddressFromLine(path[1], table: table);
        if (adr == 0x001F0000 || adr == 0x00140003) {
          // 移除 ._ADR
          final lpcName = path[0].substring(0, path[0].length - 5);
          final lpcHid = "$lpcName._HID";
          if (table['paths'].any((x) => x[0] == lpcHid)) continue;
          Log("=> In $tableName found $lpcName");
          return lpcName;
        }
      }
    }

    Log.warning("=> found LPC(B)!Operation aborted!");
    // 未找到 LPC(B)
    return null;
  }

  /// 确保 DSDT 存在
  /// [allowAny] 是否允许任何 DSDT
  bool _ensureDSDT({bool allowAny = false}) {
    if (allowAny) {
      return d.acpiTables.isNotEmpty;
    } else {
      return d.getDsdt() != null;
    }
  }

  /// 确保 DSDT 存在
  /// [allowAny] 是否允许任何 DSDT
  Future<bool> ensureDSDT({bool allowAny = false}) async {
    // 检查是否已经有有效的 iasl
    if (!checkIasl()) return false;
    // 检查是否已经有有效的 dsdt
    if (_ensureDSDT(allowAny: allowAny)) return true;
    // 未找到有效的 dsdt
    Log.warning("found DSDT ! DSDT  DSDT !");
    return false;
  }

  /// 选择 DSDT
  /// [singleTable] 是否仅选择一个表
  /// [dsdtPath] DSDT 文件路径
  Future<String?> selectDsdt({
    bool singleTable = false,
    String? dsdtPath,
  }) async {
    // 如果传入了 DSDT 文件路径，直接验证和加载
    if (dsdtPath != null && dsdtPath.isNotEmpty) {
      Log(" DSDT Path: $dsdtPath");
      String out = await util.checkPath(filePath: dsdtPath);
      if (out.isNotEmpty) {
        // 路径有效，加载并返回结果
        return await loadTables(out);
      } else {
        Log(" DSDT Path: $dsdtPath");
        // 路径无效，返回 null
        return null;
      }
    }
    return null;
  }

  /// 获取唯一设备 (设备名称, 设备编号)
  /// [parentPath] 父路径
  /// [baseName] 基础名称
  /// [startingNumber] 起始数字
  /// [usedNames] 已使用名称
  ({String name, int number}) getUniqueDevice(
    String parentPath,
    String baseName, {
    int startingNumber = 0,
    List<String> usedNames = const [],
  }) {
    int num = startingNumber;

    while (true) {
      String name;

      if (num < 0) {
        // 尝试原始名称
        name = baseName;
        // 下一轮开始从 0
        num = 0;
      } else {
        // 将数字转为大写十六进制，并附加在 baseName 后
        final hexNum = num.toRadixString(16).toUpperCase();
        final maxLen = baseName.length - hexNum.length;
        // 防止越界
        name = maxLen > 0 ? baseName.substring(0, maxLen) + hexNum : hexNum;
      }

      final fullPath = '${parentPath.replaceAll(RegExp(r'\.$'), '')}.$name';

      if (d.getDevicePaths(obj: fullPath).isEmpty &&
          !usedNames.contains(name)) {
        return (name: name, number: num);
      }

      num += 1;
    }
  }

  /// 获取唯一名称
  /// [name] 名称
  /// [targetFolder] 目标文件夹
  /// [nameAppend] 名称后缀
  String getUniqueName(
    String name,
    String targetFolder, {
    String nameAppend = "-Patched",
  }) {
    // 获取文件的扩展名
    String ext = name.contains('.') ? name.split('.').last : '';
    // 去除扩展名部分
    if (ext.isNotEmpty) {
      name = name.substring(0, name.length - ext.length - 1);
    }
    // 如果有指定后缀，则添加
    if (nameAppend.isNotEmpty) {
      name = '$name$nameAppend';
    }
    // 检查文件名是否已经存在
    String checkName = ext.isNotEmpty ? '$name.$ext' : name;
    if (!File('$targetFolder/$checkName').existsSync()) {
      return checkName;
    }

    // 需要生成唯一的文件名
    int num = 1;
    while (true) {
      checkName = '$name-$num';
      if (ext.isNotEmpty) {
        checkName = '$checkName.$ext';
      }
      if (!File('$targetFolder/$checkName').existsSync()) {
        return checkName;
      }
      // 增加数字计数
      num++;
    }
  }

  /// 检查 iasl 工具是否存在
  bool checkIasl() {
    if (config.useLeagcyiAsl) {
      Log.warning(legacyWarning);
    }
    if (d.acpiTool.iasl.isEmpty && d.acpiTool.iaslLegacy.isEmpty) {
      Log.error("iasl!Updatingiasl!");
      return false;
    }
    return true;
  }

  /// 加载 DSDT 或文件夹中的有效 ACPI 表
  /// [fileOrFolderPath] 文件或文件夹路径
  Future<String?> loadTables(String fileOrFolderPath) async {
    if (!checkIasl() || fileOrFolderPath.isEmpty) return null;
    final stopwatch = Stopwatch()..start();
    try {
      List<String> tables = [];
      List<String> exclude = [];
      String? troubleDsdt;
      bool fixed = false;
      String? temp;
      // 备份 acpiTables
      final priorTables = Map<String, dynamic>.from(d.acpiTables);
      // 清空 acpiTables
      d.acpiTables.clear();
      if (Directory(fileOrFolderPath).existsSync()) {
        Log("In $fileOrFolderPath ACPI...");
        final dir = Directory(fileOrFolderPath);
        final items = dir
            .listSync()
            .whereType<File>() // 只保留文件（排除目录）
            .where(
              (f) =>
                  f.path.toLowerCase().endsWith('.aml') ||
                  f.path.toLowerCase().endsWith('.dat'),
            ) // 只保留 .aml 或 .dat 文件
            .map((e) => path.basename(e.path))
            .toList();
        for (var item in sortedNicely(items)) {
          if (d.tableIsValid(fileOrFolderPath, tableName: item)) {
            tables.add(item);
          }
        }
        Log('found ${items.length} ACPI,  ${tables.length} :');
        for (var table in tables) {
          Log('   $table');
        }
        if (tables.isEmpty) {
          final acpiDir = Directory(path.join(fileOrFolderPath, "ACPI"));
          if (acpiDir.existsSync()) {
            return await loadTables(path.join(fileOrFolderPath, "ACPI"));
          }

          Log.warning("found .aml !\n");
          d.acpiTables.addAll(priorTables);
          return null;
        }

        final dsdtList = tables
            .where(
              (t) => d.tableSignature(path.join(fileOrFolderPath, t)) == "DSDT",
            )
            .toList();
        if (dsdtList.isEmpty) {
          Log.warning("found DSDT ! DSDT  DSDT !");
          return null;
        }
        if (dsdtList.length > 1) {
          Log(" DSDT : ");
          for (var dsdt in sortedNicely(dsdtList)) {
            Log("=> $dsdt");
          }
          Log.warning("to DSDT , . DSDT , .\n");
          d.acpiTables = priorTables;
          return null;
        }

        final dsdt = dsdtList.isNotEmpty ? dsdtList.first : null;
        if (dsdt != null && dsdt.isNotEmpty) {
          Log("");
          Log(" $dsdt, ...");
          final (result, failed) = await d.loadTable(
            path.join(fileOrFolderPath, dsdt),
          );
          if (result.isNotEmpty) {
            exclude.add(dsdt);
            Log('=> !\n');
          } else {
            troubleDsdt = dsdt;
          }
        }
      } else if (File(fileOrFolderPath).existsSync()) {
        Log("In ${path.basename(fileOrFolderPath)}...");
        final (result, failed) = await d.loadTable(fileOrFolderPath);
        if (d.tableSignature(fileOrFolderPath) != "DSDT") {
          Log.warning(" DSDT ! DSDT !");
          d.acpiTables.addAll(priorTables);
          return null;
        }
        if (result.isNotEmpty || (result[0] != null && result[0].isNotEmpty)) {
          Log("!\n");
          return path.dirname(fileOrFolderPath);
        }
        troubleDsdt = path.basename(fileOrFolderPath);
        tables.add(troubleDsdt);
        fileOrFolderPath = path.dirname(fileOrFolderPath);
      } else {
        Log("In!\n");
        d.acpiTables = priorTables;
        return null;
      }

      // 处理有问题的 DSDT 文件
      if (troubleDsdt != null && troubleDsdt.isNotEmpty) {
        Log(" DSDT  ...");
        temp = Directory.systemTemp.createTempSync().path;
        for (var table in tables) {
          File(
            path.join(fileOrFolderPath, table),
          ).copySync(path.join(temp, table));
        }

        final troublePath = path.join(temp, troubleDsdt);
        Log("...");
        Log("In $troubleDsdt to...");
        var data = await File(troublePath).readAsBytes();
        final out = await util.checkPath(
          filePath: path.join(temp, "output"),
          onError: (error) => Log.error(error),
        );
        final targetName = getUniqueName(
          troubleDsdt,
          out,
          nameAppend: "-Patched",
        );

        List<Map<String, String>> patches = [];
        Log("In...\n");
        for (var patch in prePatches) {
          if (!(patch.containsKey("PrePatch") &&
              patch.containsKey("Comment") &&
              patch.containsKey("Find") &&
              patch.containsKey("Replace"))) {
            continue;
          }
          Log(" => ${patch["PrePatch"]}");
          final find = Uint8List.fromList(List.from(patch["Find"]!.codeUnits));
          if (util.containsSublist(data, find)) {
            patches.add(patch);
            final replace = Uint8List.fromList(
              List.from(patch["Replace"]!.codeUnits),
            );
            Log("=> , In...");
            data = Uint8List.fromList(
              data.sublist(0, data.indexOf(find.first)) +
                  replace +
                  data.sublist(data.indexOf(find.first) + find.length),
            );
            File(troublePath).writeAsBytesSync(data);
            final (result, failed) = await d.loadTable(troublePath);
            if (result.isNotEmpty) {
              fixed = true;
              Log("=> DSDT!");
              exclude.remove(troublePath);
              makePlist(acpi: null, patches: patches);
              File(path.join(outputFolder, targetName)).writeAsBytesSync(data);
              Log("=> to, In Results : \n   $targetName");
              break;
            }
          }
        }

        if (!fixed) {
          Log.error("$troubleDsdt !\n");
          Directory(temp).deleteSync(recursive: true);
          d.acpiTables = priorTables;
          return null;
        }
      }

      if (tables.length > 1) {
        Log("In $fileOrFolderPath ACPI...");
      }
      final (result, failed) = await d.loadTable(
        fileOrFolderPath,
        exclude: exclude,
      );

      if (result.isEmpty && failed.isNotEmpty) {
        d.acpiTables = priorTables;
      }
      Log("ACPI!");
      if (temp != null && temp.isNotEmpty) {
        Directory(temp).deleteSync(recursive: true);
      }
      return fileOrFolderPath;
    } finally {
      stopwatch.stop();
      final totalTimeMs = stopwatch.elapsedMilliseconds;
      final totalSeconds = (totalTimeMs / 1000).toStringAsFixed(2);
      Log(': $totalSeconds \n');
    }
  }

  /// 写入 SSDT 文件
  /// [ssdtName] SSDT 名称
  /// [ssdt] SSDT 内容
  /// [delDsl] 是否删除 .dsl 文件
  Future<bool> writeSSDT(String ssdtName, String ssdt, {bool? delDsl}) async {
    delDsl ??= config.deleteDsl;

    // 确保输出路径存在
    final String res = await util.checkPath(
      filePath: path.join(config.outputDirectory ?? '', outputFolder),
      onError: (error) => Log.error(error),
    );

    // 唯一临时名（只用于编译）
    final String uid = DateTime.now().microsecondsSinceEpoch.toString();
    final String tmpDsl = path.join(res, '$ssdtName.$uid.dsl');
    final String tmpAml = path.join(res, '$ssdtName.$uid.aml');

    // 最终目标 AML（固定）
    final String finalDsl = path.join(res, '$ssdtName.dsl');
    final String finalAml = path.join(res, '$ssdtName.aml');

    final String iaslPath = config.useLeagcyiAsl
        ? d.acpiTool.iaslLegacy
        : d.acpiTool.iasl;

    // 写入临时 DSL
    await File(tmpDsl).writeAsString(ssdt);

    Log(
      l10nGlobal.msg_c17e90使用【iasl-legacy旧版编译器】' : 'l10nGlobal.msg_bacbe9((ssdtName).toString()),
      level: config.useLeagcyiAsl ? LogLevel.warning : LogLevel.info,
    );

    final List<String> iaslArgs = config.force
        ? [iaslPath, '-f', tmpDsl]
        : [iaslPath, tmpDsl];

    try {
      final out = await run.run([
        {'args': iaslArgs},
      ]);
      if (out[2] != '0') {
        Log.error(' : ${out[1]}');
        Log.error(
          l10nGlobal.msg_b33a08
          '${config.useLeagcyiAsl ? ' 建议更换新版 iasl 或开启强制编译再试!' : ''}',
        );
        return false;
      }

      Log(' $ssdtName.aml !');
      // 编译成功，重命名 AML 文件
      await File(tmpAml).rename(finalAml);
      return true;
    } finally {
      // 始终清理临时 DSL
      final tmpDslFile = File(tmpDsl);
      if (await tmpDslFile.exists()) {
        // 用于日志提示删除操作
        if (delDsl) Log(',  $ssdtName.dsl ');
        await tmpDslFile.delete();
      }
      // 如果不保留 DSL，删除最终 DSL
      if (delDsl) {
        final finalDslFile = File(finalDsl);
        if (await finalDslFile.exists()) {
          await finalDslFile.delete();
        }
      } else {
        await File(finalDsl).writeAsString(ssdt);
      }
    }
  }

  /// 提取 Field 内部所有行（保留 Offset 和原始格式）
  List<String> getFieldVarWithPath(String devicePath) {
    final deviceInfo = getDeviceAllInfo(devicePath: devicePath);
    final fields = deviceInfo['fields'];
    final lines = <String>[];
    // 遍历 fields，找到包含 PMEE 的 Field
    for (var field in fields) {
      // 找到大括号 { 和 } 之间的内容
      final braceStart = field.indexOf('{');
      final braceEnd = field.lastIndexOf('}');

      if (braceStart == -1 || braceEnd == -1 || braceEnd <= braceStart) {
        // 如果没有找到大括号，直接返回空列表
        return lines;
      }

      // 提取内部文本
      final body = field.substring(braceStart + 1, braceEnd);

      // 按行拆分，保留每一行原始缩进和逗号
      for (var line in body.split(RegExp(r'[\r\n]+'))) {
        line = line.trim();
        if (line.isNotEmpty) {
          lines.add(line);
        }
      }
    }

    return lines;
  }

  /// 获取设备的所有信息
  /// [devicePath] 设备路径
  /// [table] ACPI 表 （可选）
  Map<String, dynamic> getDeviceAllInfo({
    required String devicePath,
    Map<String, dynamic>? table,
  }) {
    table ??= d.getDsdt();

    final List<String> names = [];
    final List<String> methods = [];
    final List<String> opRegions = [];
    final List<String> fields = [];
    final List<String> devices = [];

    // 获取设备完整 Scope（每行为一项）
    final scope = d.getScopeOfDevice(
      devicePath: devicePath,
      table: table,
      stripComments: true,
    );

    if (scope.isEmpty) {
      Log("=> found $devicePath  Scope");
      return {
        "valid": false,
        "device": devicePath,
        "names": names,
        "methods": methods,
        "operationRegions": opRegions,
        "fields": fields,
        "devices": devices,
      };
    }

    // 逐行解析 scope，使用 depth 跟踪大括号层级
    // 只收集 depth == 1 的一级成员；当遇到子 Device 时，把它加入 devices 并跳过其 block
    final lines = scope; // List<String>
    int depth = 0;

    // 首先确定 scope 起始处并初始化 depth：
    // 找到第一个含 "{" 的行并把 depth 置为 1，从下一行开始解析
    int startIndex = 0;
    for (int i = 0; i < lines.length; i++) {
      if (lines[i].contains("{")) {
        startIndex = i + 1;
        depth = 1;
        break;
      }
    }
    // 如果没有找到 '{'，仍从 0 开始（防御）
    if (depth == 0) {
      startIndex = 0;
      depth = 1;
    }

    // 从 given index 起找到与之匹配的 '}' 的行索引（根据 brace 计数）
    int findMatchingBrace(int fromIndex) {
      int b = 0;
      for (int j = fromIndex; j < lines.length; j++) {
        final l = lines[j];
        // 在同一行可能同时包含 { 和 }
        for (int k = 0; k < l.length; k++) {
          if (l[k] == '{') {
            b++;
          } else if (l[k] == '}') {
            if (b == 0) {
              // 如果先出现 } 而 b==0，说明在外层遇到结束，返回当前行
              return j;
            } else {
              b--;
              if (b == 0) return j;
            }
          }
        }
      }
      return lines.length - 1;
    }

    // 主循环：从 startIndex 解析到 scope 结束（depth 回到 0）
    int i = startIndex;
    while (i < lines.length) {
      String raw = lines[i];
      String line = raw.trim();

      // 更新 depth 基于当前行的 { 和 } 出现数量（在跳块时控制 i）
      // 若行里含 'Device (' 开头，且当前 depth==1，表示子设备（一级子设备）
      final deviceHeaderMatch = RegExp(
        r'^\s*Device\s*\(\s*([A-Za-z0-9_]+)\s*\)',
        caseSensitive: false,
      ).firstMatch(raw);

      if (deviceHeaderMatch != null && depth == 1) {
        // 记录子设备 header 原始行
        devices.add(raw.trim());

        // 跳过该子设备的整个块：找匹配的 '}' 行
        // 寻找从当前行开始第一个 '{'，再找到匹配的 '}'
        int firstBraceLine = -1;
        for (int t = i; t < lines.length; t++) {
          if (lines[t].contains("{")) {
            firstBraceLine = t;
            break;
          }
        }
        if (firstBraceLine == -1) {
          // 没找到 '{'，就仅跳过当前行
          i++;
          continue;
        }
        int matchLine = findMatchingBrace(firstBraceLine);
        // 继续解析从 matchLine + 1
        i = matchLine + 1;
        continue;
      }

      // 若当前 depth == 1，采集 Name / Method / OperationRegion / Field
      if (depth == 1) {
        // ---- Name (single-line) ----
        if (line.startsWith("Name (")) {
          names.add(raw.trim());
          i++;
          continue;
        }

        // ---- OperationRegion (通常单行) ----
        if (line.startsWith("OperationRegion")) {
          opRegions.add(raw.trim());
          i++;
          continue;
        }

        // ---- Method (可能多行，有大括号) ----
        if (line.startsWith("Method (") || line.startsWith("method (")) {
          // 捕获从当前行开始直到匹配的 '}' 为止的完整 block
          // 找到第一行包含 '{' 的行（可能是当前行或后续行）
          int braceStart = -1;
          for (int t = i; t < lines.length; t++) {
            if (lines[t].contains("{")) {
              braceStart = t;
              break;
            }
          }
          if (braceStart == -1) {
            // 没有找到 '{'，将当前行作为 method（防御）
            methods.add(raw.trim());
            i++;
            continue;
          }
          int matchLine = findMatchingBrace(braceStart);
          // 拼接从 i 到 matchLine 的所有行
          final buffer = StringBuffer();
          for (int t = i; t <= matchLine; t++) {
            buffer.writeln(lines[t]);
          }
          methods.add(buffer.toString().trim());
          i = matchLine + 1;
          continue;
        }

        // ---- Field (完整保留所有内容，包括定义行 + 大括号内部) ----
        if (line.startsWith("Field (") || line.startsWith("field (")) {
          // 找到第一行包含 '{' 的行（可能是当前行，也可能在后面）
          int braceStart = i;
          while (braceStart < lines.length &&
              !lines[braceStart].contains("{")) {
            braceStart++;
          }

          // 如果没找到 '{'，至少保留当前行
          if (braceStart >= lines.length) {
            fields.add(raw.trim());
            i++;
            continue;
          }

          // 找到匹配闭合 '}'
          int braceCount = 0;
          int matchLine = braceStart;
          for (int t = braceStart; t < lines.length; t++) {
            final l = lines[t];
            for (int c = 0; c < l.length; c++) {
              if (l[c] == '{') braceCount++;
              if (l[c] == '}') {
                braceCount--;
                if (braceCount == 0) {
                  matchLine = t;
                  break;
                }
              }
            }
            if (braceCount == 0) break;
          }

          // 拼接从定义行 i 到 matchLine 的所有行
          final buffer = StringBuffer();
          for (int t = i; t <= matchLine; t++) {
            buffer.writeln(lines[t]);
          }
          fields.add(buffer.toString().trim());

          // 跳到闭合行的下一行
          i = matchLine + 1;
          continue;
        }
      }

      // 若未特殊匹配，按行更新 depth：count '{' 和 '}'
      // 子设备 Device 内的深度会影响外层采集（已通过跳块处理）,这里仅更新 depth 基于行出现的 { 和 }
      int opens = RegExp(r'\{').allMatches(raw).length;
      int closes = RegExp(r'\}').allMatches(raw).length;
      depth += opens - closes;

      // 当 depth <= 0 时结束（scope 结束）
      if (depth <= 0) break;

      i++;
    }

    return {
      "valid": true,
      "device": devicePath,
      "names": names,
      "methods": methods,
      "operationRegions": opRegions,
      "fields": fields,
      "devices": devices,
    };
  }

  /// 获取设备的 STA 变量
  /// [varS] STA 变量名称
  /// [device] 设备名称
  /// [devHid] 设备 HID
  /// [devName] 设备名称
  /// [table] ACPI 表
  Map<String, dynamic> getStaVar({
    String varS = "STAS",
    String? device,
    String devHid = "ACPI000E",
    String devName = "AWAC",
    Map<String, dynamic>? table,
  }) {
    table ??= d.getDsdt();
    bool hasVar = false;
    List<Map<String, dynamic>> patches = [];
    String? root;

    // 如果提供了设备,先定位设备
    List<List<dynamic>> devList;
    if (device != null && device.isNotEmpty) {
      devList = d.getDevicePaths(obj: device, table: table);
      if (devList.isEmpty) {
        Log("=>  $device");
        return {"value": false};
      }
    } else {
      // 如果没有提供设备,直接定位 HID
      Log("In $devHid ($devName) ...");
      devList = d.getDevicePathsWithHid(hid: devHid, table: table);
      if (devList.isEmpty) {
        Log("=> to $devHid ");
        return {"valid": false};
      }
    }

    var dev = devList[0];
    Log("=> found ${dev[0]}");

    root = dev[0].split(".")[0];
    Log("=> In _STA...");

    // 先检查方法,再检查名称
    String staType = "MethodObj";
    var sta = d.getMethodPaths(obj: "${dev[0]}._STA", table: table);
    var xsta = d.getMethodPaths(obj: "${dev[0]}.XSTA", table: table);

    if (sta.isEmpty && xsta.isEmpty) {
      // 检查名称
      staType = "IntObj";
      sta = d.getNamePaths(obj: "${dev[0]}._STA", table: table);
      xsta = d.getNamePaths(obj: "${dev[0]}.XSTA", table: table);
    }

    /// 检查是否已经 XSTA 重命名
    if (xsta.isNotEmpty && sta.isEmpty) {
      Log("=> _STA  XSTA!skipping...");
      Log("=> DSDT _STA to XSTA , !\n");
      return {
        "valid": false,
        "break": true,
        "device": dev,
        "dev_name": devName,
        "dev_hid": devHid,
        "sta_type": staType,
      };
    }

    /// 检查 STA 变量是否存在
    if (sta.isNotEmpty) {
      if (varS.isNotEmpty) {
        var scope = d
            .getScope(
              startingIndex: sta[0][1],
              stripComments: true,
              table: table,
            )
            .join("\n");
        hasVar = scope.contains(varS);
        Log("=> $varS ${hasVar ? 'In' : 'In'}");
      }
    } else {
      Log("=> found _STA method/");
    }

    /// 检查是否需要为 _STA => XSTA 生成唯一的补丁
    if (sta.isNotEmpty && !hasVar) {
      var staIndex = d.findNextHex(index: sta[0][1], table: table).$2;
      Log("=> In $staIndex found _STA method!");
      String staHex = "5F535441"; // _STA
      String xstaHex = "58535441"; // XSTA
      Log("=> In _STA to XSTA ");
      final (padl, padr) = d.getShortestUniquePad(
        currentHex: staHex,
        index: staIndex,
        table: table,
      );
      patches.add({
        "Comment": "$devName _STA to XSTA rename",
        "Find": padl + staHex + padr,
        "Replace": padl + xstaHex + padr,
      });
    }

    return {
      "valid": true,
      "has_var": hasVar,
      "sta": sta,
      "patches": patches,
      "device": dev,
      "dev_name": devName,
      "dev_hid": devHid,
      "root": root,
      "sta_type": staType,
    };
  }

  /// 检查 STA 设备是否需要补丁
  /// [sta] STA 设备信息
  /// [table] ACPI 表
  bool staNeedsPatching(Map<String, dynamic>? sta, Map<String, dynamic> table) {
    // 检查输入是否有效
    if (sta == null || !sta.containsKey("sta")) {
      return false;
    }

    // 处理 IntObj 类型
    if (sta["sta_type"] == "IntObj") {
      try {
        String staScope = table["lines"][sta["sta"][0][1]];
        if (!staScope.contains("Name (_STA, 0x0F)")) {
          return true;
        }
      } catch (e) {
        Log.error("IntObj: $e");
        return true;
      }
    }
    // 处理 MethodObj 类型
    else if (sta["sta_type"] == "MethodObj") {
      try {
        String staScope = d
            .getScope(
              startingIndex: sta["sta"][0][1],
              stripComments: true,
              table: table,
            )
            .join("\n");
        if (staScope.split("Return (").length - 1 > 1 ||
            !staScope.contains("Return (0x0F)")) {
          Log('=> In, value Return (0x0F)');
          return true;
        }
      } catch (e) {
        Log.error("MethodObj: $e");
        return true;
      }
    }

    // 默认返回 false
    return false;
  }

  /// 转换整数为16进制字符串
  /// [integer] 要转换的整数
  /// [padTo] 要填充的长度，默认为0
  String hexy(int integer, {int padTo = 0}) {
    String hexStr = integer.toRadixString(16).toUpperCase();
    String padded = hexStr.padLeft(padTo, '0');
    return '0x$padded';
  }

  /// 处理转换PCI路径
  /// [devicePath] 要转换的设备路径
  String? sanitizeDevicePath(String devicePath) {
    devicePath = devicePath.trim().toLowerCase();

    if (!devicePath.startsWith('pciroot(')) {
      // 不是有效的设备路径，返回 null
      return null;
    }

    // 去除 pciroot() 和 pci()，并按 / 或 # 分割
    final raw = devicePath
        .replaceAll('pciroot(', '')
        .replaceAll('pci(', '')
        .replaceAll(')', '');

    final segments = raw.split(RegExp(r'[#/\\]'));
    final newPath = <String>[];

    for (var i = 0; i < segments.length; i++) {
      final adr = segments[i];
      if (i == 0) {
        // PciRoot 地址
        if (adr.contains(',')) return null;
        try {
          final value = int.parse(adr.replaceFirst('0x', ''), radix: 16);
          newPath.add('PciRoot(${hexy(value)})');
        } catch (_) {
          return null;
        }
      } else {
        try {
          int adr1, adr2;
          if (adr.contains(',')) {
            final parts = adr.split(',');
            adr1 = int.parse(parts[0].replaceFirst('0x', ''), radix: 16);
            adr2 = int.parse(parts[1].replaceFirst('0x', ''), radix: 16);
          } else {
            final value = int.parse(adr.replaceFirst('0x', ''), radix: 16);
            adr2 = value & 0xFF;
            adr1 = (value >> 8) & 0xFF;
          }
          newPath.add('Pci(${hexy(adr1)},${hexy(adr2)})');
        } catch (_) {
          return null;
        }
      }
    }

    return newPath.join('/');
  }

  /// 处理设备路径
  /// [inputPaths] 要处理的设备路径列表
  Map<String, String?> getDevicePath({List<String> inputPaths = const []}) {
    final Map<String, String?> paths = {};

    for (var pathEntry in inputPaths) {
      final parts = pathEntry.trim().split(RegExp(r'\s+'));
      String? path;
      String? dev;

      if (parts.length == 1) {
        path = parts[0];
      } else if (parts.length == 2) {
        path = parts[0];
        dev = parts[1];
      } else {
        // 格式错误，跳过
        continue;
      }

      // 处理 device 名称
      if (dev != null && dev.isNotEmpty) {
        dev = dev.replaceAll('_', '').toUpperCase();
        if (!RegExp(r'^[A-Z0-9]{1,4}$').hasMatch(dev)) {
          // 非法设备名,跳过
          continue;
        }
        dev = dev.padRight(4, '0');
      }

      path = sanitizeDevicePath(path);
      if (path == null || path.isEmpty) continue;
      paths[path] = dev;
    }

    return paths;
  }

  (Map<String, Map<String, dynamic>>, List<Map<String, dynamic>>)
  getDevicePaths() {
    Log("In ACPI ...");
    final deviceDict = <String, Map<String, dynamic>>{};
    final pciRootPaths = <Map<String, dynamic>>[];
    final orphanedDevices = <List<dynamic>>[];
    final sanitizedPaths = <List<dynamic>>[];

    for (final tableName in sortedNicely(d.acpiTables.keys.toList())) {
      final table = d.acpiTables[tableName];

      var pciRoots = d.getDevicePathsWithHid(hid: "PNP0A08", table: table);
      pciRoots += d.getDevicePathsWithHid(hid: "PNP0A03", table: table);
      pciRoots += d.getDevicePathsWithHid(hid: "ACPI0016", table: table);

      final paths = d.getPathOfType(objType: "Name", obj: "_ADR", table: table);

      for (final path in pciRoots) {
        if (deviceDict.containsKey(path[0])) continue;

        final deviceUid = d.getNamePaths(obj: "${path[0]}._UID", table: table);
        final adr = (deviceUid.isNotEmpty && deviceUid.length == 1)
            ? getAddressFromLine(
                deviceUid[0][1],
                splitBy: "_UID, ",
                table: table,
              )
            : 0;

        deviceDict[path[0]] = {"path": "PciRoot(${hexy(adr ?? 0)})"};
        pciRootPaths.add(deviceDict[path[0]]!);
      }

      for (final x in paths) {
        sanitizedPaths.add([
          x[0].substring(0, x[0].length - 5),
          x[1],
          x[2],
          getAddressFromLine(x[1], table: table),
        ]);
      }
    }

    Log("In ACPI device path...");

    bool checkPath(List<dynamic> path) {
      final adr = path[3];
      bool adrOverflow = false;

      try {
        int adr1 = (adr >> 16) & 0xFFFF;
        int adr2 = adr & 0xFFFF;
        int radr1 = adr1;
        int radr2 = adr2;

        if (adr1 > 0xFF) {
          adrOverflow = true;
          radr1 = 0;
        }
        if (adr2 > 0xFF) {
          adrOverflow = true;
          radr2 = 0;
        }

        final pathKey = path[0];
        if (deviceDict.containsKey(pathKey)) return true;

        final parent = pathKey.split('.')..removeLast();
        final parentKey = parent.join('.');
        final parentDevice = deviceDict[parentKey];

        if (parentDevice == null || parentDevice["path"] == null) {
          return false;
        }

        var devicePath = parentDevice["path"] as String;
        devicePath += "/Pci(${hexy(adr1)},${hexy(adr2)})";
        deviceDict[pathKey] = {"path": devicePath};

        if (adrOverflow || parentDevice.containsKey("adr_overflow")) {
          deviceDict[pathKey]!["adr_overflow"] = true;
          final parentPath = parentDevice["adj_path"] ?? parentDevice["path"];
          deviceDict[pathKey]!["adj_path"] =
              "$parentPath/Pci(${hexy(radr1)},${hexy(radr2)})";

          if (adrOverflow) {
            final devOverflow =
                (deviceDict[pathKey]!["dev_overflow"] ?? <String>[])
                    as List<String>;
            devOverflow.add(pathKey);
            deviceDict[pathKey]!["dev_overflow"] = devOverflow;
          }
        }

        return true;
      } catch (_) {
        return true;
      }
    }

    sanitizedPaths.sort((a, b) => a[0].compareTo(b[0]));

    for (final path in sanitizedPaths) {
      if (!checkPath(path)) {
        orphanedDevices.add(path);
      }
    }

    if (orphanedDevices.isNotEmpty) {
      Log("In...");
      while (true) {
        final removed = <List<dynamic>>[];
        for (final path in orphanedDevices) {
          if (checkPath(path)) {
            removed.add(path);
          }
        }
        if (removed.isEmpty) break;
        for (final r in removed) {
          orphanedDevices.removeWhere((x) => x[0] == r[0]);
        }
      }
    }

    return (deviceDict, pciRootPaths);
  }

  /// 将形如 "Pci(0x1,0x0)/Pci(0x2,0x0)" 的路径解析为桥接地址列表
  List<int> getBridgeDevices(String path) {
    // 清理并拆分路径（去除 PciRoot/Pci/括号，按 # 或 / 分隔）
    final cleanedPath = path
        .toLowerCase()
        .replaceAll('pciroot(', '')
        .replaceAll('pci(', '')
        .replaceAll(')', '');

    final adrs = cleanedPath.split(RegExp(r'#|/'));
    final bridges = <int>[];

    for (final bridge in adrs) {
      if (bridge.isEmpty) continue;

      /// 出错，不支持桥接 PciRoot
      if (!bridge.contains(',')) return [];

      try {
        final parts = bridge.split(',');
        final adr1 = int.parse(parts[0].replaceFirst('0x', ''), radix: 16);
        final adr2 = int.parse(parts[1].replaceFirst('0x', ''), radix: 16);
        final adrInt = (adr1 << 16) + adr2;
        bridges.add(adrInt);
      } catch (_) {
        // 出错时直接返回空列表
        return [];
      }
    }

    return bridges;
  }

  /// 获取所有匹配的路径（使用元组：设备名、设备信息、是否完全匹配、匹配路径长度）
  /// 例如：('PC00.BR1A', {info}, true, 12)
  /// [deviceDict] 设备字典
  /// [matchPath] 匹配路径
  /// [adj] 是否使用 adj_path
  List<(String, Map<String, dynamic>, bool, int)> getAllMatches(
    Map<String, Map<String, dynamic>> deviceDict,
    String matchPath, {
    bool adj = false,
  }) {
    final key = adj ? 'adj_path' : 'path';
    final matches = <(String, Map<String, dynamic>, bool, int)>[];

    for (final entry in deviceDict.entries) {
      final device = entry.value[key];
      if (device is! String || device.isEmpty) continue;

      final pathLower = matchPath.toLowerCase();
      final deviceLower = device.toLowerCase();

      if (pathLower.startsWith(deviceLower)) {
        matches.add((
          entry.key,
          entry.value,
          deviceLower == pathLower,
          device.length,
        ));
      }
    }

    return matches;
  }

  /// 返回最长路径匹配的元组 (String, Map, bool, int)
  /// 例如: ('_SB.PCI0', {device info...}, true, 5)
  /// [deviceDict] 设备字典
  /// [matchPath] 匹配路径
  /// [adj] 是否使用 adj_path
  (String, Map<String, dynamic>, bool, int)? getLongestMatch(
    Map<String, Map<String, dynamic>> deviceDict,
    String matchPath, {
    bool adj = false,
  }) {
    final matches = getAllMatches(deviceDict, matchPath, adj: adj);
    if (matches.isEmpty) return null;
    // 按元组第 4 项（路径深度）降序排序
    matches.sort((a, b) => b.$4.compareTo(a.$4));
    return matches.first;
  }

  /// 通过地址获取设备路径
  /// targetAdr 目标地址
  /// excludeNames 排除名称列表
  /// 返回值: 包含设备路径、父路径和表名的元组，如果未找到则返回null
  ({String busPath, String busParent, String tableName})? getDevAtAdr({
    int targetAdr = 0x001F0004,
    List<String> excludeNames = const ["XHC"],
  }) {
    for (var tableName in sortedNicely(d.acpiTables.keys.toList())) {
      var table = d.acpiTables[tableName];
      var paths = d.getPathOfType(objType: "Name", obj: "_ADR", table: table);
      for (var path in paths) {
        var adr = getAddressFromLine(path[1], table: table);
        if (adr == targetAdr) {
          // 去掉 ._ADR
          var pathParts = path[0].split('.')..removeLast();
          if (pathParts.length > 1) {
            final lastPart = pathParts.last.toLowerCase();
            final hasExcludedName = excludeNames.any(
              (x) => lastPart.contains(x.toLowerCase()),
            );

            if (!hasExcludedName) {
              final busPath = pathParts.join('.');
              final busParent = pathParts
                  .sublist(0, pathParts.length - 1)
                  .join('.');
              return (
                busPath: busPath,
                busParent: busParent,
                tableName: tableName,
              );
            }
          }
        }
      }
    }

    return null;
  }

  /// 分割 IRQ 串，处理子串，返回结果列表
  /// [line] IRQs字符串
  List<int> getIntForLine(String line) {
    List<int> irqList = [];
    for (var i in line.split(":")) {
      irqList.add(sameLineIrq(i));
    }
    return irqList;
  }

  /// 对同一行的 IRQ（中断请求）值求和，然后返回求和结果
  /// [irq] IRQs字符串
  int sameLineIrq(String irq) {
    int total = 0;
    for (var i in irq.split(",")) {
      if (i == "#") {
        /// 当IRQ值为#时,表示空值,直接跳过
        continue;
      }
      try {
        int irqValue = int.parse(i.replaceFirst('0x', ''));
        if (irqValue > 15 || irqValue < 0) {
          /// 当IRQ值超出范围时,直接跳过
          continue;
        }
        total |= util.convertIrqToInt(irqValue);
      } catch (e) {
        /// 当IRQ值不是整数时,直接跳过
        continue;
      }
    }
    return total;
  }

  /// 从IRQs字符串中提取十六进制值
  /// [irq] IRQs字符串
  /// [remIrq] 要移除的IRQs列表
  List<Map<String, dynamic>> getHexFromIrqs(String irq, List<int>? remIrq) {
    List<Map<String, dynamic>> lines = [];
    List<int> remd = [];

    for (var a in irq.split("-")) {
      var parts = a.split("|");
      int index = int.parse(parts[0].replaceFirst('0x', ''));
      String i = parts[1];

      List<int> find = getIntForLine(i);
      List<int> repl = List.filled(find.length, 0);

      if (remIrq != null && remIrq.isNotEmpty) {
        /// 复制find列表到repl列表
        repl = List.from(find);
        for (var x in remIrq) {
          int rem = util.convertIrqToInt(x);
          // 按位操作
          List<int> repl1 = repl
              .map((y) => y >= rem ? y & (rem ^ 0xFFFF) : y)
              .toList();

          if (!util.deepEquals(repl, repl1)) {
            /// 当repl和repl1不相等时,说明有IRQ被移除
            /// 记录移除的IRQ
            remd.add(x);
          }

          /// 更新repl列表为repl1
          repl = List.from(repl1);
        }
      }

      String findHex = find.map((x) => "22${util.getHexFromInt(x)}").join('');
      String replHex = repl.map((x) => "22${util.getHexFromInt(x)}").join('');

      Map<String, dynamic> patch = {
        "irq": i,
        "find": findHex,
        "repl": replHex,
        "remd": remd,
        "index": index,
        "changed": findHex != replHex,
      };

      lines.add(patch);
    }

    return lines;
  }

  /// 从IRQs字符串中提取所有IRQ值
  /// [irq] IRQs字符串
  List<int> getAllIrqs(String irq) {
    Set<int> irqList = {};
    // 按 "-" 分割输入字符串
    for (String a in irq.split("-")) {
      // 按 "|" 分割并取第二个元素
      String i = a.split("|")[1];
      // 按 ":" 分割
      for (String x in i.split(":")) {
        // 按 "," 分割
        for (String y in x.split(",")) {
          if (y == "#") {
            continue;
          }
          irqList.add(int.parse(y));
        }
      }
    }
    // 将集合转换为列表并排序
    return irqList.toList()..sort();
  }

  ///   根据选择,获取IRQ
  ///   选择的选项（C, O, L等）
  ///   O:选择冲突的 IRQ，并将其与 targetIrqs 关联
  ///   L:选择 Legacy IRQ，并将其与空列表关联
  ///   C:选择 Legacy IRQ，并将其与 targetIrqs 关联
  ///   自定义输入格式：DEV1:IRQ1,IRQ2
  (Map<String, List<int>> irqPatches, List<String> currentLegacyIRQs)
  getIrqChoice(
    Map<String, Map<String, dynamic>>? irqs, {
    List<String> namesAndHids = const [
      "PIC",
      "IPIC",
      "TMR",
      "TIMR",
      "RTC",
      "RTC0",
      "RTC1",
      "PNPC0000",
      "PNP0100",
      "PNP0B00",
    ],
    String selectedOption = "",
  }) {
    // 检查是否有 IRQ 信息
    if (irqs == null || irqs.isEmpty) {
      Log.warning(" IRQ !");
      return ({}, []);
    }

    if (selectedOption.isEmpty) {
      Log.warning("IRQs!IRQ!");
      return ({}, []);
    }

    final validOptions = {'C', 'O', 'L'};
    final upperCaseOption = selectedOption.toUpperCase();
    if (!validOptions.contains(upperCaseOption)) {
      Log("IRQs: $upperCaseOption");
    }

    int hidPad = irqs.values
        .map((irqData) => irqData['hid']?.length ?? 0)
        .reduce((a, b) => a > b ? a : b);
    // 根据设备名称和 HID 确定默认设备
    List<String> defaults = irqs.keys.where((key) {
      var irqData = irqs[key];
      return namesAndHids.contains(key.toUpperCase()) ||
          namesAndHids.contains(irqData?['hid']?.toUpperCase());
    }).toList();
    List<String> currentLegacyIRQs = [];
    if (irqs.isEmpty) {
      Log.warning("=> found IRQ !");
    }
    const String kHighlightSymbol = '*';
    const String kEmptySymbol = ' ';
    const int kXPadLength = 4;
    irqs.forEach((x, value) {
      final isHighlighted = x.toUpperCase().containsAny(namesAndHids);
      final prefixSymbol = isHighlighted ? kHighlightSymbol : kEmptySymbol;
      final paddedX = x.padLeft(kXPadLength);
      final hidPart = hidPad == 0
          ? ''
          : value['hid'] != null
          ? "- ${value['hid'].toString().padLeft(hidPad)}"
          : ''.padLeft(hidPad + 2);

      final irqContent = getAllIrqs(value['irq']);
      final irqLine = hidPad == 0
          ? '$prefixSymbol $paddedX: $irqContent'
          : '$prefixSymbol $paddedX $hidPart: $irqContent';

      currentLegacyIRQs.add(irqLine);
    });
    Map<String, List<int>> devices = {};

    // 根据选择的选项来更新设备和IRQ配置
    if (selectedOption.toLowerCase() == "o") {
      // 仅冲突的 IRQ
      for (var x in irqs.keys) {
        // 将目标 IRQ 关联到所有设备
        devices[x] = List.from(targetIrqs);
      }
    } else if (selectedOption.toLowerCase() == "l") {
      // Legacy 设备，清空 IRQ 配置
      for (var x in defaults) {
        // 仅 Legacy 设备，不关联任何 IRQ
        devices[x] = [];
      }
    } else if (selectedOption.toLowerCase() == "c") {
      // 仅 Legacy 设备并且冲突 IRQ
      for (var x in defaults) {
        // 将目标 IRQ 关联到 Legacy 设备
        devices[x] = List.from(targetIrqs);
      }
    } else {
      // 提供了自定义输入
      if (selectedOption.isNotEmpty) {
        var inputs = selectedOption.split(" ");
        for (var i in inputs) {
          if (i.isEmpty) continue;

          try {
            var parts = i.split(":");
            var name = parts[0].toUpperCase();
            var val = parts.length > 1
                ? parts[1]
                      .split(",")
                      .where((e) => e.trim().isNotEmpty)
                      .map((e) => int.parse(e.trim().replaceFirst('0x', '')))
                      .toList()
                : <int>[];
            devices[name] = val;
          } catch (e) {
            Log.error(" IRQ !!!, IRQ!!!");
            Log("=> : RTC:0 IPIC:2 TMR:8,11 \n");
            // 错误,返回空字典
            return ({}, []);
          }
        }
      }
    }

    return (devices, currentLegacyIRQs);
  }

  /// 列出所有中断
  Future<Map<String, Map<String, String>>> listIrqs() async {
    if (!await ensureDSDT()) return {};
    // 存储设备及其中断信息
    Map<String, Map<String, String>> devices = {};
    String? currentDevice;
    String? currentHid;
    bool irq = false;
    bool lastIrq = false;
    int irqIndex = 0;

    // 遍历 DSDT 中的行
    var lines = d.getDsdt()?['lines'] ?? '';
    for (int index = 0; index < lines.length; index++) {
      String line = lines[index];

      if (d.isHex(line)) {
        // 跳过所有十六进制行
        continue;
      }

      if (irq) {
        // 获取 IRQ 值
        String num = line.split("{")[1].split("}")[0].replaceAll(r" ", "");
        num = num.isEmpty ? "#" : num;

        if (devices.containsKey(currentDevice)) {
          if (lastIrq) {
            // 如果是连续的 IRQ
            devices[currentDevice]!["irq"] =
                "${devices[currentDevice]!["irq"]!}:$num";
          } else {
            // 如果跳过了至少一行
            irqIndex = d.findNextHex(index: index).$2;
            devices[currentDevice]!["irq"] =
                "${devices[currentDevice]!["irq"]!}-$irqIndex|$num";
          }
        } else {
          irqIndex = d.findNextHex(index: index).$2;
          if (currentDevice != null && currentDevice.isNotEmpty) {
            devices[currentDevice] = {"irq": "$irqIndex|$num"};
          }
        }

        irq = false;
        lastIrq = true;
      } else if (line.contains("Device (")) {
        // 如果保留 _HID
        if (currentDevice != null &&
            currentDevice.isNotEmpty &&
            devices.containsKey(currentDevice) &&
            currentHid != null &&
            currentHid.isNotEmpty) {
          // 保存 _HID
          devices[currentDevice]!["hid"] = currentHid;
        }
        lastIrq = false;
        currentHid = null;

        try {
          currentDevice = line.split("(")[1].split(")")[0];
        } catch (e) {
          currentDevice = null;
          continue;
        }
      } else if (line.contains("_HID, ") &&
          currentDevice != null &&
          currentDevice.isNotEmpty) {
        if (line.contains('"')) {
          try {
            currentHid = line.split('"')[1];
            // "Name (_HID, EisaId ("PNP0C02") /* PNP Motherboard Resources */)  // _HID: Hardware ID"
            // 可以获取到 _HID  =  PNP0C02
            // Log("=> found _HID: $currentHid");
          } catch (e) {
            // "                    Method (_HID, 0, NotSerialized)  // _HID: Hardware ID"
            // 无法获取到 _HID ,忽略错误，继续解析下一行
            Log.error("=> _HID : $e");
          }
        } else {
          // 没有双引号，无法获取 _HID，跳过
          currentHid = null;
        }
      } else if (line.contains("IRQNoFlags") &&
          currentDevice != null &&
          currentDevice.isNotEmpty) {
        // 下一行是中断信息
        irq = true;
      }
      // 检查是否是填充行
      else if (line
          .replaceAll(r"{", "")
          .replaceAll(r"}", "")
          .replaceAll(r"(", "")
          .replaceAll(r")", "")
          .replaceAll(r" ", "")
          .split("//")[0]
          .isNotEmpty) {
        // 重置 lastIrq，因为它不是连续的
        lastIrq = false;
      }
    }

    // 如果需要，保留最后的 _HID
    if (currentDevice != null &&
        currentDevice.isNotEmpty &&
        devices.containsKey(currentDevice) &&
        currentHid != null &&
        currentHid.isNotEmpty) {
      devices[currentDevice]!["hid"] = currentHid;
    }

    return devices;
  }

  /// 生成 HPET 补丁
  /// [devs] 设备列表
  /// [targetIrqs] 目标 IRQ 列表
  Future<void> ssdtHPET({
    Map<String, Map<String, dynamic>>? devs,
    Map<String, List<int>>? targetIrqs,
  }) async {
    if (!await ensureDSDT()) return;
    // 校验 devs
    if (devs == null || devs.isEmpty) {
      Log.warning("found,skipping HPET !");
      return;
    }
    // 校验 targetIrqs
    if (targetIrqs == null ||
        targetIrqs.isEmpty ||
        targetIrqs.values.every((list) => list.isEmpty)) {
      Log.warning(" IRQs  IRQs ! Operation aborted!");
      return;
    }
    Log("In PNP0103 (HPET) ...");
    var hpets = d.getDevicePathsWithHid(hid: "PNP0103");
    bool hpetFake = hpets.isEmpty;
    List<Map<String, dynamic>> patches = [];
    bool hpetSTA = false;
    String? name;
    Map? sta;
    // 定义 CRS 和 XCRS 值
    String crs = "5F435253";
    String xcrs = "58435253";
    String padl = '', padr = '';
    String? memAccess, memBase, memLength;
    bool gotMem = false;
    List hpet = [];
    if (hpets.isNotEmpty) {
      name = hpets[0][0];
      Log("=> in $name");
      // 定位 _STA 方法
      sta = getStaVar(devHid: "PNP0103", devName: "HPET");
      if (sta['patches'] != null && sta['patches'].isNotEmpty) {
        hpetSTA = true;
        patches.addAll(sta['patches']);
      }
      // 定位 HPET 的 _CRS 方法/名称
      Log("In HPET  _CRS method/...");
      hpet = d.getMethodPaths(obj: "$name._CRS");
      if (hpet.isEmpty) {
        hpet = d.getNamePaths(obj: "$name._CRS");
      }
      if (hpet.isEmpty) {
        // 检查 XCRS 方法/名称是否已应用重命名
        var xcrsPaths = d.getMethodPaths(obj: "$name.XCRS");
        if (xcrsPaths.isEmpty) {
          xcrsPaths = d.getNamePaths(obj: "$name.XCRS");
        }
        if (xcrsPaths.isEmpty) {
          Log.warning("=>  $name._CRS!Operation aborted!");
        } else {
          Log.warning("=>  $name._CRS!");
          Log.warning("=> _CRS XCRS!");
          Log.warning("=> DSDT _CRS to XCRS , !\n");
        }
        return;
      }

      Log("=> in $name._CRS");
      var crsIndex = d.findNextHex(index: hpet[0][1]).$2;
      Log("=> In: $crsIndex found");
      Log("=> : ${hpet[0].last}");
      // 在 HPET 的 _CRS 方法中查找 Memory32Fixed 部分
      Log("=> In Memory32Fixed...");

      bool primed = false;

      // 迭代 HPET 作用域中的每一行
      for (var line in d.getScope(
        startingIndex: hpets[0][1],
        stripComments: true,
      )) {
        if (line.contains("Memory32Fixed (")) {
          try {
            // 从行中提取内存访问类型
            memAccess = line.split("(")[1].split(",")[0];
          } catch (e) {
            Log.warning("=> !");
            break;
          }
          primed = true;
          continue;
        }
        if (!primed) {
          continue;
        } else if (line.contains(")")) {
          // 已到达作用域结束
          break;
        }
        // 已准备好并未到达作用域结束 - 尝试获取 Base 和 Length
        String val = "";
        try {
          val = line
              .trim()
              .split(",")[0]
              .replaceAll(r"Zero", "0x0")
              .replaceAll(r"One", "0x1");
        } catch (e) {
          // 无法将 Base 或 Length 转换为整数 - 可能使用了变量，回退到默认值
          Log.warning("=>  Base  Length !");
          break;
        }

        // 给 memBase 赋值
        if (memBase == null) {
          memBase = val;
        } else {
          memLength = val;
          // 已获取到 Base 和 Length，跳出循环
          break;
        }
      }
      // 检查是否获取到了所需的值
      gotMem =
          memAccess != null &&
          memAccess.isNotEmpty &&
          memBase != null &&
          memBase.isNotEmpty &&
          memLength != null &&
          memLength.isNotEmpty;
      if (gotMem) {
        Log("=> to $memAccess $memBase => $memLength");
      } else {
        memAccess = "ReadWrite";
        memBase = "0xFED00000";
        memLength = "0x00000400";
        Log.warning("=> found!");
        Log.warning("=> value $memBase => $memLength");
      }

      /// 查找最短的唯一填充
      final pads = d.getShortestUniquePad(currentHex: crs, index: crsIndex);
      padl = pads.$1;
      padr = pads.$2;

      patches.add({
        "Comment":
            "${name?.split(".").last.replaceFirst(RegExp(r'\\'), "")} _CRS to XCRS rename",
        "Find": padl + crs + padr,
        "Replace": padl + xcrs + padr,
      });
    } else {
      Log.warning("=> found!");
      name = getLpcName(skipEc: true, skipCommonNames: true);
      if (name == null) {
        return;
      }
    }

    Log("");
    Log("In IRQ ...");
    if (sta != null &&
        sta.isNotEmpty &&
        sta['patches'] != null &&
        sta['patches'].isNotEmpty) {
      Log(
        "=> ${name?.split('.').last.replaceAll('\\', '')} _STA to XSTA rename:",
      );
      Log("           Find: ${patches[0]['Find']}");
      Log("     Replace: ${patches[0]['Replace']}");
      Log("");
    }
    if (!hpetFake) {
      Log(
        "=> ${name?.split('.').last.replaceAll('\\', '')} _CRS to XCRS rename:",
      );
      Log("           Find: $padl$crs$padr");
      Log("     Replace: $padl$xcrs$padr");
      Log("");
    }
    Log("In IRQ...");
    // 校验 targetIrqs
    if (targetIrqs.isEmpty) {
      Log("IRQ !skipping...\n");
    }
    if (devs.isEmpty) {
      Log.warning("=> !");
      Log("");
    }

    var savedDSDT = d.getDsdt()?["raw"];
    var uniquePatches = {};
    var genericPatches = [];

    for (var dev in devs.keys) {
      if (!targetIrqs.containsKey(dev)) {
        continue;
      }

      var irqPatches = getHexFromIrqs(devs[dev]!['irq'] ?? '', targetIrqs[dev]);
      var i = irqPatches.where((x) => x['changed'] == true).toList();

      for (var t in i) {
        if (!t['changed']) {
          // 未进行任何修补 - 跳过
          continue;
        }

        // 尝试已知的结尾值：7900、4701 和 8609 —— 同时允许最多 8 个字符的填充
        String pattern = r"(" + t["find"] + r"(.{0,8})(7900|4701|8609))";
        var regExp = RegExp(pattern);
        var index = t['index'];
        var result = d.getHexStartingAt(index);
        var hex = result.$1;
        var matches = regExp.allMatches(hex).toList();
        // 如果有匹配，提取所有捕获组
        if (matches.isNotEmpty) {
          // List<String> result = [
          //   matches.first.group(1) ?? "",
          //   matches.first.group(2) ?? "",
          //   matches.first.group(3) ?? "",
          // ];
          // Log("  $result"); // 输出结果数组
        } else {
          Log("found.");
        }
        if (matches.isEmpty) {
          Log.warning(" $dev  IRQ (${t['find']})!skipping...");
          continue;
        }

        if (matches.length > 1) {
          // 找到多个匹配项！将它们全部添加为 find/replace 条目
          for (var match in matches) {
            genericPatches.add({
              'remd': ((t['remd'] as List).toSet().toList()..sort()).join(','),
              'orig': t['find'],
              'find': t['find'] + match.group(2)! + match.group(3)!,
              'repl': t['repl'] + match.group(2)! + match.group(3)!,
            });
          }
          continue;
        }

        // 如果只有一个匹配项
        var ending = matches.first.group(2)! + matches.first.group(3)!;
        final (padl, padr) = d.getShortestUniquePad(
          currentHex: t['find'] + ending,
          index: t['index'],
        );
        var tPatch = padl + t['find'] + ending + padr;
        var rPatch = padl + t['repl'] + ending + padr;

        if (!uniquePatches.containsKey(dev)) {
          uniquePatches[dev] = [];
        }

        uniquePatches[dev]!.add({
          'dev': dev,
          'remd': ((t['remd'] as List).toSet().toList()..sort()).join(','),
          'orig': t['find'],
          'find': tPatch,
          'repl': rPatch,
        });
      }
    }

    // 检查唯一的 IRQ 修补项
    if (uniquePatches.isNotEmpty) {
      uniquePatches.forEach((x, patchesList) {
        for (int i = 0; i < patchesList.length; i++) {
          var p = patchesList[i];
          String patchName = "$x IRQ ${p['remd']} Patch";

          if (patchesList.length > 1) {
            patchName += " - ${i + 1} of ${patchesList.length}";
          }

          patches.add({
            "Comment": patchName,
            "Find": p["find"],
            "Replace": p["repl"],
          });

          Log("=> $patchName");
          Log("            Find: ${p["find"]}");
          Log("      Replace: ${p["repl"]}");
          Log("");
        }
      });
    }

    if (genericPatches.isNotEmpty) {
      List<Map<String, dynamic>> genericSet = [];
      // 确保不会重复 find 值
      for (var x in genericPatches) {
        bool exists = genericSet.any((patch) => util.deepEquals(patch, x));
        if (!exists) {
          genericSet.add(x);
        }
      }

      Log.warning(", !\n");

      for (int i = 0; i < genericSet.length; i++) {
        var x = genericSet[i];
        String patchName =
            "Generic IRQ Patch ${i + 1} of ${genericSet.length} - ${x['remd']} - ${x['orig']}";

        patches.add({
          "Comment": patchName,
          "Find": x["find"],
          "Replace": x["repl"],
          "Disabled": true,
          "Enabled": false,
        });

        Log("=> $patchName");
        Log("         Find: ${x["find"]}");
        Log("   Replace: ${x["repl"]}");
        Log("");
      }
    }
    d.getDsdt()?["raw"] = savedDSDT;
    final String ssdtName = "SSDT-HPET";
    Log("In $ssdtName.dsl...");
    var ssdt = '';
    if (hpetFake) {
      Log("In HPET ...");
      ssdt =
          """
DefinitionBlock ("", "SSDT", 2, "RAPID", "HPET", 0x00000000)
{
    External ([[name]], DeviceObj)

    Scope ([[name]])
    {
        Device (HPET)
        {
            Name (_HID, EisaId ("PNP0103") 
            Name (_CID, EisaId ("PNP0C01") 
            Method (_STA, 0, NotSerialized)  
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Name (_CRS, ResourceTemplate ()  
            {
                IRQNoFlags ()
                    {0,8}
                Memory32Fixed (ReadWrite, // Access Type
                    0xFED00000,           // Address Base
                    0x00000400,           // Address Length
                    )
            })
        }
    }
}"""
              .replaceAll(r"[[name]]", name ?? '');
    } else {
      // 初始化 SSDT 配置的基本部分
      ssdt = """//
// Supplementary HPET _CRS from Goldfish64
// requires at least the HPET's _CRS to XCRS rename
DefinitionBlock ("", "SSDT", 2, "RAPID", "HPET", 0x00000000)
{
    External ([[name]], DeviceObj)
    External ([[name]].XCRS, [[type]])

    Scope ([[name]])
    {
        Name (BUFX, ResourceTemplate ()
        {
            IRQNoFlags ()
                {0,8}
            // [[mem]]
            Memory32Fixed ([[mem_access]],
                [[mem_base]],           
                [[mem_length]],          
            )
        })
        Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
        {
            If (LOr (_OSI ("Darwin"), LNot(CondRefOf ([[name]].XCRS))))
            {
                Return (BUFX)
            }
            // Not macOS and XCRS exists - return its result
            Return ([[name]].XCRS[[method]])
        }""";
      // 替换 [[name]] 为传入的 `name`
      ssdt = ssdt.replaceAll(r"[[name]]", name ?? '');

      // 根据 hpet[0].last 的值选择 "MethodObj" 或 "BuffObj"
      ssdt = ssdt.replaceAll(
        r"[[type]]",
        hpet[0].last == "Method" ? "MethodObj" : "BuffObj",
      );

      // 根据 `gotMem` 来选择内存配置信息
      ssdt = ssdt.replaceAll(
        r"[[mem]]",
        gotMem
            ? "AccessType/Base/Length pulled from DSDT"
            : "Default AccessType/Base/Length - verify with your DSDT!",
      );

      // 替换内存配置信息
      ssdt = ssdt.replaceAll(r"[[mem_access]]", memAccess ?? '');
      ssdt = ssdt.replaceAll(r"[[mem_base]]", memBase ?? '');
      ssdt = ssdt.replaceAll(r"[[mem_length]]", memLength ?? '');

      // 根据 hpet[0].last 的值选择是否使用 "()"
      ssdt = ssdt.replaceAll(
        r"[[method]]",
        hpet[0].last == "Method" ? " ()" : "",
      );

      // 根据 hpetSta 和相关条件修改配置
      if (hpetSTA) {
        List<String> ssdtParts = [];
        bool external = false;

        // 逐行处理 ssdt 配置，插入外部引用 XSTA 方法
        ssdt.split("\n").forEach((line) {
          if (line.trim().contains("External (")) {
            external = true;
          } else if (external) {
            ssdtParts.add("    External ([[name]].XSTA, ${sta?['sta_type']})");
            external = false;
          }
          ssdtParts.add(line);
        });

        // 追加 XSTA 方法
        ssdt = ssdtParts.join("\n");
        ssdt += "\n";
        ssdt += """
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            // Return 0x0F if booting macOS or the XSTA method
            // no longer exists for some reason
            If (LOr (_OSI ("Darwin"), LNot (CondRefOf ([[name]].XSTA))))
            {
                Return (0x0F)
            }
            // Not macOS and XSTA exists - return its result
            Return ([[name]].XSTA[[called]])
        }""";
        ssdt = ssdt.replaceAll(r"[[name]]", name ?? '');
        ssdt = ssdt.replaceAll(
          r"[[called]]",
          sta?['sta_type'] == "MethodObj" ? " ()" : "",
        );
      }

      // 关闭最终的括号
      ssdt += "\n";
      ssdt += """
    }
}""";
    }
    //写入到SSDT文件
    writeSSDT(ssdtName, ssdt);
    final acpi = {
      "Comment": hpetFake
          ? "HPET Device Fake"
          : "${name?.split('.').last.replaceAll('\\', '')} _CRS - requires _CRS to XCRS rename",
      "Enabled": true,
      "Path": "$ssdtName.aml",
    };
    makePlist(acpi: acpi, patches: patches);
  }

  Future<void> ssdtPNLF({
    bool prebuilt = false,
    int? uid = 99,
    bool? getIgpu = false,
    String? manualIGPUPath,
  }) async => prebuilt
      ? await _ssdtPNLFPrebuilt()
      : await _ssdtPNLF(
          uid: uid,
          getIgpu: getIgpu,
          manualIGPUPath: manualIGPUPath,
        );

  bool _isExactPnlfDevicePath(List<dynamic> pathInfo) {
    if (pathInfo.length < 3 || pathInfo[2] != "Device") return false;

    final lastSegment = pathInfo[0]
        .toString()
        .split(".")
        .last
        .replaceAll(RegExp(r"_+$"), "")
        .toUpperCase();
    return lastSegment == "PNLF";
  }

  List<_NativePnlfDevice> _findNativePnlfDevices() {
    final matches = <_NativePnlfDevice>[];
    final sortedTableNames = sortedNicely(d.acpiTables.keys.toList());

    for (final tableName in sortedTableNames) {
      final rawTable = d.acpiTables[tableName];
      if (rawTable is! Map<String, dynamic>) continue;

      final paths = d.getPathOfType(
        objType: "Device",
        obj: "PNLF",
        table: rawTable,
      );
      for (final pathInfo in paths) {
        if (!_isExactPnlfDevicePath(pathInfo)) continue;
        matches.add((tableName: tableName, table: rawTable, path: pathInfo));
      }
    }

    return matches;
  }

  String _externalAcpiPath(String acpiPath) {
    final cleanPath = acpiPath.replaceFirst("\\", "");
    return cleanPath
        .split(".")
        .map((part) => part == "_SB" ? "_SB_" : part)
        .join(".");
  }

  String _normalizeManualIgpuPath(String manualIGPUPath) {
    List<String> parts = manualIGPUPath
        .replaceFirst("\\", "")
        .toUpperCase()
        .split(".");
    String valid = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_";
    String noStart = "0123456789";

    if (parts.any(
      (p) =>
          p.isEmpty ||
          p.length > 4 ||
          noStart.contains(p[0]) ||
          p.split("").any((x) => !valid.contains(x)),
    )) {
      Log(" iGPU Path: $manualIGPUPath");
    }

    parts = parts.map((p) => p.replaceAll(RegExp(r"_+$"), "")).toList();
    return "\\${parts.join(".")}";
  }

  _IgpuPathResult _findIgpuPath({
    String? manualIGPUPath,
    bool allowManual = false,
  }) {
    String igpu = "";
    bool guessed = false;

    Log("Inin 0x00020000  iGPU ...");
    final tableNameList = d.acpiTables.keys.toList();
    final sortedTableNames = sortedNicely(tableNameList, first: "DSDT");

    for (final tableName in sortedTableNames) {
      final table = d.acpiTables[tableName];
      Log("In $tableName...");
      final paths = d.getPathOfType(objType: "Name", obj: "_ADR", table: table);

      for (final path in paths) {
        final adr = getAddressFromLine(path[1], table: table);
        if (adr == 0x00020000) {
          igpu = path[0].substring(0, path[0].length - 5);
          Log("=> In $igpu found iGPU !");
          return (path: igpu, guessed: false, manual: false);
        }
      }
    }

    Log("found iGPU !");
    Log("In iGPU ...");

    for (final tableName in sortedTableNames) {
      final rawTable = d.acpiTables[tableName];
      if (rawTable is! Map<String, dynamic>) continue;
      Log("In $tableName...");

      final pciRoots = [
        d.getDevicePathsWithHid(hid: "PNP0A08", table: rawTable),
        d.getDevicePathsWithHid(hid: "PNP0A03", table: rawTable),
        d.getDevicePathsWithHid(hid: "ACPI0016", table: rawTable),
      ];

      final external = <String>[];
      rawTable["lines"]?.forEach((line) {
        final trimmedLine = line.toString().trim();
        if (!trimmedLine.startsWith("External (")) return;
        try {
          final pathPart = trimmedLine.split('(')[1].split(', ')[0];
          final processedPath = pathPart
              .split('.')
              .map(
                (segment) =>
                    segment.replaceAll('\\', '').replaceAll(RegExp(r'_+$'), ''),
              )
              .join('.');
          external.add('\\$processedPath');
        } catch (_) {
          debugPrint("Error processing line: $trimmedLine");
        }
      });

      for (final rootList in pciRoots) {
        if (rootList.isEmpty) continue;
        final rootPath = rootList[0][0].toString();
        for (final name in [
          "IGPU",
          "_VID",
          "VID0",
          "VID1",
          "GFX0",
          "VGA",
          "_VGA",
        ]) {
          final testPath = "$rootPath.$name";
          final devicePaths = d.getDevicePaths(obj: testPath, table: rawTable);
          String? device;
          if (devicePaths.isNotEmpty) {
            device = devicePaths[0][0];
          } else {
            device = external.firstWhere(
              (x) => testPath == x,
              orElse: () => "",
            );
            if (device.isEmpty) device = null;
          }

          if (device == null) continue;
          if (d
              .getPathOfType(
                objType: "Name",
                obj: "$device._ADR",
                table: rawTable,
              )
              .isNotEmpty) {
            continue;
          }

          igpu = device;
          guessed = true;
          Log("=> In $igpu  iGPU ");
          return (path: igpu, guessed: guessed, manual: false);
        }
      }
    }

    if (allowManual && manualIGPUPath != null && manualIGPUPath.isNotEmpty) {
      Log("iGPUPath, $manualIGPUPath \n");
      return (
        path: _normalizeManualIgpuPath(manualIGPUPath),
        guessed: false,
        manual: true,
      );
    }

    return (path: "l10nGlobal.msg_64dce7 UID, !");
      return;
    }

    final uidList = PNLFUIDs.map((item) => item['UID']).toList();
    if (!uidList.contains(uid)) {
      Log.warning("$uid  UID, , !");
    }

    bool getIGpuInfo = false;
    if (uid == 14) {
      Log("");
      Log.warning(
        "注意:英特尔第1代Arrandale,第2代Sandy Bridge,第3代Ivy Bridge 默认使用 UID:14,但是有些机器使用UID: 14 会遇到最大亮度受限或其他问题.为了解决这些问题,必须设置正确的 iGPU（集成显卡）的设备路径，并且可能需要补充IGPU寄存器信息",
      );
      Log("");
      getIGpuInfo = getIgpu ?? false;
    }
    final String ssdtName = "SSDT-PNLF";
    Log("In $ssdtName.dsl...l10nGlobal.msg_ca711e=> UID: ${item['UID']}");
        Log("=> : ${item['Platform']}");
        break;
      }
    }

    final autoIgpu = _findIgpuPath();
    final pnlfParentPath = autoIgpu.path;
    String igpu = autoIgpu.path;
    bool guessed = autoIgpu.guessed;
    bool manual = false;

    if (pnlfParentPath.isNotEmpty) {
      Log("=> Found ACPI Path: $pnlfParentPath");
      Log("=> In $pnlfParentPath  Device (PNLF)");
    } else {
      Log("=> found ACPI Path");
      Log("=>  Device (PNLF)");
    }

    if (getIGpuInfo && igpu.isEmpty) {
      if (manualIGPUPath == null || manualIGPUPath.isEmpty) {
        Log.warning("In ACPI found iGPU Path!\n");
        Log.warning(
          "请输入要使用的 iGPU ACPI 路径。每个路径元素的字符限制为 4 个字母数字字符（以字母或下划线开头），并用空格分隔。例如: SB.PCI0.GFX0\n",
        );
      } else {
        Log("iGPUPath, $manualIGPUPath \n");
        igpu = _normalizeManualIgpuPath(manualIGPUPath);
        guessed = false;
        manual = true;
      }
    }

    List<Map<String, dynamic>> patches = [];

    final tableNameList = d.acpiTables.keys.toList();
    final sortedTableNames = sortedNicely(tableNameList);

    Log("In ACPI In PNLF ...");
    final nativePnlfDevices = _findNativePnlfDevices();
    if (nativePnlfDevices.isNotEmpty) {
      final nativePnlf = nativePnlfDevices.first;
      Log("=> In ${nativePnlf.tableName} found PNLF : ${nativePnlf.path[0]}");
      Log("=>  PNLF  XNLF, In...");
      patches.add({
        "Comment": "PNLF to XNLF rename - requires $ssdtName.aml",
        "Find": "504E4C46",
        "Replace": "584E4C46",
        "Table": nativePnlf.table,
      });
    } else {
      Log("=> found PNLF !");
      Log("=>  PNLF to XNLF !l10nGlobal.msg_bd7d7b084E4243460A00");
    final nbcfNew = util.getHexBytes("084E42434600l10nGlobal.msg_18852araw"] != null &&
          table["raw"].isNotEmpty &&
          util.containsSublist(table["raw"], nbcfOld)) {
        Log("In $tableName to Name (NBCF, 0x00), In...");
        hasNbcfOld = true;
        patches.add({
          "Comment": "NBCF 0x00 to 0x01 for BrightnessKeys.kext",
          "Find": "084E4243460A00",
          "Replace": "084E4243460A01",
          "Enabled": true,
          "Disabledl10nGlobal.msg_a436c5raw"] != null &&
          table["raw"].isNotEmpty &&
          util.containsSublist(table["raw"], nbcfNew)) {
        Log("In $tableName to Name (NBCF, Zero), In...");
        hasNbcfNew = true;
        patches.add({
          "Comment": "NBCF Zero to One for BrightnessKeys.kext",
          "Find": "084E42434600",
          "Replace": "084E42434601",
          "Enabled": true,
          "Disabledl10nGlobal.msg_097878""//
// Much of the info pulled from: https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/Source/SSDT-PNLF.dsl
//
DefinitionBlock ("", "SSDT", 2, "RAPID", "PNLF", 0x00000000)
{""";
    final externalPaths = <String>{};
    if (pnlfParentPath.isNotEmpty) externalPaths.add(pnlfParentPath);
    if (getIGpuInfo && igpu.isNotEmpty) externalPaths.add(igpu);

    for (final externalPath in externalPaths) {
      ssdt +=
          """
    External (${_externalAcpiPath(externalPath)}, DeviceObj)
""";
    }
    String pnlfDevice = """
    Device (PNLF)
    {
        Name (_HID, EisaId ("APP0002"))  // _HID: Hardware ID
        Name (_CID, "backlight")  // _CID: Compatible ID
        Name (_UID, [[uid_value]])  // _UID: Unique ID: [[uid_dec]]
        
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0B)
            }
            Else
            {
                Return (Zero)
            }
        }""";
    if (getIGpuInfo && igpu.isNotEmpty) {
      pnlfDevice += """
        Method (_INI, 0, Serialized)
        {
            If (LAnd (_OSI ("Darwin"), CondRefOf ([[igpu_path]])))
            {
                OperationRegion ([[igpu_path]].RMP3, PCI_Config, Zero, 0x14)
                Field ([[igpu_path]].RMP3, AnyAcc, NoLock, Preserve)
                {
                    Offset (0x02), GDID,16,
                    Offset (0x10), BAR1,32,
                }
                // IGPU PWM backlight register descriptions:
                //   LEV2 not currently used
                //   LEVL level of backlight in Sandy/Ivy
                //   P0BL counter, when zero is vertical blank
                //   GRAN see description below in INI1 method
                //   LEVW should be initialized to 0xC0000000
                //   LEVX PWMMax except FBTYPE_HSWPLUS combo of max/level (Sandy/Ivy stored in MSW)
                //   LEVD level of backlight for Coffeelake
                //   PCHL not currently used
                OperationRegion (RMB1, SystemMemory, BAR1 & ~0xF, 0xe1184)
                Field(RMB1, AnyAcc, Lock, Preserve)
                {
                    Offset (0x48250),
                    LEV2, 32,
                    LEVL, 32,
                    Offset (0x70040),
                    P0BL, 32,
                    Offset (0xc2000),
                    GRAN, 32,
                    Offset (0xc8250),
                    LEVW, 32,
                    LEVX, 32,
                    LEVD, 32,
                    Offset (0xe1180),
                    PCHL, 32,
                }
                // Now fixup the backlight PWM depending on the framebuffer type
                // At this point:
                //   Local4 is RMCF.BLKT value (unused here), if specified (default is 1)
                //   Local0 is device-id for IGPU
                //   Local2 is LMAX, if specified (Ones means based on device-id)
                //   Local3 is framebuffer type

                // Adjustment required when using WhateverGreen.kext
                Local0 = GDID
                Local2 = Ones
                Local3 = 0

                // check Sandy/Ivy
                // #define FBTYPE_SANDYIVY 1
                If (LOr (LEqual (1, Local3), LNotEqual (Match (Package()
                {
                    // Sandy HD3000
                    0x010b, 0x0102,
                    0x0106, 0x1106, 0x1601, 0x0116, 0x0126,
                    0x0112, 0x0122,
                    // Ivy
                    0x0152, 0x0156, 0x0162, 0x0166,
                    0x016a,
                    // Arrandale
                    0x0046, 0x0042,
                }, MEQ, Local0, MTR, 0, 0), Ones)))
                {
                    if (LEqual (Local2, Ones))
                    {
                        // #define SANDYIVY_PWMMAX 0x710
                        Store (0x710, Local2)
                    }
                    // change/scale only if different than current...
                    Store (LEVX >> 16, Local1)
                    If (LNot (Local1))
                    {
                        Store (Local2, Local1)
                    }
                    If (LNotEqual (Local2, Local1))
                    {
                        // set new backlight PWMMax but retain current backlight level by scaling
                        Store ((LEVL * Local2) / Local1, Local0)
                        Store (Local2 << 16, Local3)
                        If (LGreater (Local2, Local1))
                        {
                            // PWMMax is getting larger... store new PWMMax first
                            Store (Local3, LEVX)
                            Store (Local0, LEVL)
                        }
                        Else
                        {
                            // otherwise, store new brightness level, followed by new PWMMax
                            Store (Local0, LEVL)
                            Store (Local3, LEVX)
                        }
                    }
                }
            }
        }""";
    }
    pnlfDevice += """
    }""";

    if (pnlfParentPath.isNotEmpty) {
      final scopedPnlfDevice = pnlfDevice
          .split("\n")
          .map((line) => line.isEmpty ? line : "    $line")
          .join("\n");
      ssdt +=
          """
    Scope ([[pnlf_parent_path]])
    {
$scopedPnlfDevice
    }
}""";
    } else {
      ssdt +=
          """
$pnlfDevice
}l10nGlobal.msg_457186((uid).toString(), (patches.any((p) => p["Comment"].contains("XNLF")) ? " - requires PNLF to XNLF rename" : "").toString(), (ssdtName).toString(), (igpu).toString(), (igpu).toString(), (tableName).toString(), (ecList.length).toString(), (device).toString(), (device.split(".").sublist(0, device.split(".").length - 1).join(".")).toString(), (ecSta.isEmpty ? "" : " - must come before any EC _STA to XSTA renames!").toString(), (ecSta.isEmpty ? "rename" : "and EC _STA to XSTA renames").toString(), (ssdtName).toString())
DefinitionBlock ("", "SSDT", 2, "RAPID", "SsdtEC", 0x00001000)
{
    External ([[LPCName]], DeviceObj)
l10nGlobal.msg_e4c262((x).toString(), (x).toString(), (ecSta[x]?["sta_type"] ?? "MethodObj").toString(), (x).toString(), (x).toString(), (ecEnableSta[x]?["sta_type"] ?? "MethodObj").toString(), (x).toString(), (ecEnableSta[x]?["sta_type"] ?? "MethodObj").toString())
    Scope ($x)
    {
        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (Zero)
            }
            Else
            {
                Return (${ecSta.containsKey(x) ? "$x.XSTA${ecSta[x]?["sta_type"] == "MethodObj" ? " ()" : ""}" : "0x0F"})
            }
        }
    }
l10nGlobal.msg_11584e
    If (LAnd (CondRefOf ($x.XSTA), LNot (CondRefOf ($x._STA))))
    {
        Scope ($x)
        {
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (${ecEnableSta.containsKey(x) ? "$x.XSTA${ecEnableSta[x]?["sta_type"] == "MethodObj" ? " ()" : ""}" : "Zero"})
                }
            }
        }
    }
l10nGlobal.msg_89f598
    Scope ($lpcName)
    {
        Device (EC)
        {
            Name (_HID, "ACID0001")  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
""";
    }

    if (injectUSBPower) {
      comment += ' with USB power property support';
      ssdt += """
    Scope (\\_SB)
    {
        Device (USBX)
        {
            Name (_ADR, Zero)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (!Arg2)
                {
                    Return (Buffer (One)
                    {
                         0x03                                             // .
                    })
                }

                Return (Package (0x08)
                {
                    "kUSBSleepPowerSupply", 
                    0x13EC, 
                    "kUSBSleepPortCurrentLimit", 
                    0x0834, 
                    "kUSBWakePowerSupply", 
                    0x13EC, 
                    "kUSBWakePortCurrentLimit", 
                    0x0834
                })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
""";
    }
    ssdt += """
}l10nGlobal.msg_484dec((ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (key).toString(), (value).toString(), (tableName).toString(), (cpuName).toString(), (ssdtName).toString())
//
// Based on the sample found at https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PLUG.dsl
//
DefinitionBlock ("", "SSDT", 2, "RAPID", "CpuPlug", 0x00003000)
{
    External ([[CPUName]], ProcessorObj)
    Scope ([[CPUName]])
    {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
            If (_OSI ("Darwin")) {
                If (LNot (Arg2))
                      {
                          Return (Buffer (One)
                          {
                              0x03
                          })
                      }
                      Return (Package (0x02)
                      {
                          "plugin-type", 
                          One
                      })
            }
            Else
            {
                Return (Buffer (One)
                {
                    Zero
                })
            }
        }
    }
}l10nGlobal.msg_f3eb29((ssdtName).toString(), (procs.length).toString(), (parent).toString(), (proc[0].split('.').last).toString(), (proc[0]).toString(), (uid0).toString(), (procList.length).toString())
//
// Based on the sample found at https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/Source/SSDT-PLUG-ALT.dsl
//
DefinitionBlock ("", "SSDT", 2, "RAPID", "CpuPlugA", 0x00003000)
{
    External ([[parent]], DeviceObj)

    Scope ([[parent]])
    {l10nGlobal.msg_58b067
        Processor ([[name]], [[uid]], 0x00000510, 0x06)
        {
            // [[proc]]
            Name (_HID, "ACPI0007" /* Processor Device */)  // _HID: Hardware ID
            Name (_UID, [[uid]])
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }"""
                  .replaceAll(r"[[name]]", name)
                  .replaceAll(r"[[uid]]", uid ?? '')
                  .replaceAll(r"[[proc]]", proc ?? '');

          if (i == 0) {
            ssdt += """
            Method (_DSM, 4, NotSerialized)
            {
                If (LNot (Arg2)) {
                    Return (Buffer (One) { 0x03 })
                }

                Return (Package (0x02)
                {
                    "plugin-type",
                    One
                })
            }""";
          }

          ssdt += """
        }""";
        }

        ssdt += """
    }
}l10nGlobal.msg_a322ed((ssdtName).toString(), (ssdtName).toString())
//
// SSDT-PMC source from Acidanthera
// Original found here: https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/SSDT-PMC.dsl
//
// Uses the CORP name to denote where this was created for troubleshooting purposes.
//
DefinitionBlock ("", "SSDT", 2, "RAPID", "PMCR", 0x00001000)
{
    External ([[LPCName]], DeviceObj)
    Scope ([[LPCName]])
    {
        Device (PMCR)
        {
            Name (_HID, EisaId ("APP9876"))  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                Memory32Fixed (ReadWrite,
                    0xFE000000,         // Address Base
                    0x00010000,         // Address Length
                    )
            })
        }
    }
}
l10nGlobal.msg_f73fb2((ssdtName).toString(), (rtcCrs[0][0]).toString(), (util.hexy(lastAdr, padTo: 4)).toString(), (util.hexy(lastLen + adjust, padTo: 2)).toString(), (2).toString(), (crsIndex).toString(), (rtcDict["dev_name"]).toString(), (padl).toString(), (crsHex).toString(), (padr).toString(), (padl).toString(), (xcrsHex).toString(), (padr).toString(), (x["dev_name"]).toString(), (val.isNotEmpty ? ' and ' : x["dev_name"]).toString(), (suffix.join(', ')).toString(), (ssdtName).toString(), (ssdtName).toString())

    DefinitionBlock ("", "SSDT", 2, "RAPID", "RTC0RANGE", 0x00000000)
    {
    """;
    if ([rtcDict].any((x) => x["has_var"] == true)) {
      ssdt += """    External (STAS, IntObj)
          Scope (\\)
          {
              Method (_INI, 0, NotSerialized)  // _INI: Initialize
              {
                  If (_OSI ("Darwin"))
                  {
                      Store (One, STAS)
                  }
              }
          }
      l10nGlobal.msg_12562a    External ([[DevPath]], DeviceObj)
        External ([[DevPath]].XSTA, [[sta_type]])
        Scope ([[DevPath]])
        {
            Name (ZSTA, [[Original]])
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return ([[macOS]])
                }
                // Default to [[Original]] - but return the result of the renamed XSTA if possible
                If (CondRefOf ([[DevPath]].XSTA))
                {
                    Store ([[DevPath]].XSTA[[called]], ZSTA)
                }
                Return (ZSTA)
            }
        }
    l10nGlobal.msg_f430c5    External ([[DevPath]], DeviceObj)
              Scope ([[DevPath]])
              {
                  Method (_STA, 0, NotSerialized)  // _STA: Status
                  {
                      If (_OSI ("Darwin"))
                      {
                          Return (Zero)
                      }
                      Else
                      {
                          Return (0x0F)
                      }
                  }
              }
          l10nGlobal.msg_9181fb    External ([[DevPath]], DeviceObj)
              External ([[DevPath]].XCRS, [[type]])
              Scope ([[DevPath]])
              {
                  // Adjusted and renamed _CRS buffer ripped from DSDT with corrected range
          [[NewCRS]]
                  // End of adjusted _CRS and renamed buffer

                  // Create a new _CRS method that returns the result of the renamed XCRS
                  Method (_CRS, 0, Serialized)  // _CRS: Current Resource Settings
                  {
                      If (LOr (_OSI ("Darwin"), LNot (CondRefOf ([[DevPath]].XCRS))))
                      {
                          // Return our buffer if booting macOS or the XCRS method
                          // no longer exists for some reason
                          Return (BUFX)
                      }
                      // Not macOS and XCRS exists - return its result
                      Return ([[DevPath]].XCRS[[method]])
                  }
              }
          l10nGlobal.msg_a502cd((x).toString())    External ([[LPCName]], DeviceObj)    // (from opcode)
          Scope ([[LPCName]])
          {
              Device (RTC0)
              {
                  Name (_HID, EisaId ("PNP0B00"))  // _HID: Hardware ID
                  Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
                  {
                      IO (Decode16,
                          0x0070,             // Range Minimum
                          0x0070,             // Range Maximum
                          0x01,               // Alignment
                          0x08,               // Length
                          )
                      IRQNoFlags ()
                          {8}
                  })
                  Method (_STA, 0, NotSerialized)  // _STA: Status
                  {
                      If (_OSI ("Darwin"))
                      {
                          Return (0x0F)
                      }
                      Else
                      {
                          Return (Zero)
                      }
                  }
              }
          }
      l10nGlobal.msg_518a7b((x["dev_name"]).toString(), (val.isNotEmpty ? ' and ' : x["dev_name"]).toString(), (suffix.join(', ')).toString(), (ssdtName).toString(), (ssdtName).toString())
    DefinitionBlock ("", "SSDT", 2, "RAPID", "AWAC", 0x00000000)
    {
    """;
    if ([awacDict].any((x) => x["has_var"] == true)) {
      ssdt += """    External (STAS, IntObj)
          Scope (_SB)
          {
              Method (_INI, 0, NotSerialized)  // _INI: Initialize
              {
                  If (_OSI ("Darwin"))
                  {
                      Store (One, STAS)
                  }
              }
          }
        }
      l10nGlobal.msg_d3ca59    External ([[DevPath]], DeviceObj)
        External ([[DevPath]].XSTA, [[sta_type]])
        Scope ([[DevPath]])
        {
            Name (ZSTA, [[Original]])
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return ([[macOS]])
                }
                // Default to [[Original]] - but return the result of the renamed XSTA if possible
                If (CondRefOf ([[DevPath]].XSTA))
                {
                    Store ([[DevPath]].XSTA[[called]], ZSTA)
                }
                Return (ZSTA)
            }
        }
    l10nGlobal.msg_f430c5    External ([[DevPath]], DeviceObj)
              Scope ([[DevPath]])
              {
                  Method (_STA, 0, NotSerialized)  // _STA: Status
                  {
                      If (_OSI ("Darwin"))
                      {
                          Return (Zero)
                      }
                      Else
                      {
                          Return (0x0F)
                      }
                  }
              }
          l10nGlobal.msg_9833c4((hubs.length).toString(), (x[0].split('.').sublist(0, x[0].split('.').length - 1).join('.')).toString(), (task["device"]).toString(), (task["device"].split('.').last).toString(), (2).toString(), (staIndex).toString(), (padl + staHex + padr).toString(), (padl + xstaHex + padr).toString(), (task["device"].split('.').last).toString(), (task["device"]).toString(), (ssdtName).toString(), (ssdtName).toString(), (p).toString(), (t["device"]).toString(), (device).toString(), (parent).toString(), (newDevice).toString(), (address).toString(), (device).toString(), (path).toString(), (item['path'] ?? item).toString(), (d).toString(), (fb).toString(), (p).toString(), (3).toString(), (match.$1).toString(), (4).toString(), (match.$1).toString(), (b.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3).toString(), (match[1]).toString(), (2).toString(), (2).toString(), (2).toString(), (2).toString(), (2).toString(), (2).toString(), (3).toString(), (3).toString(), (4).toString(), (remain).toString(), (1).toString(), (bridges[i]).toString(), (1).toString(), (1).toString(), (ssdtName).toString(), (acpi).toString(), (pad * depth).toString(), (acpiString).toString(), (parentAcpi).toString(), (name).toString(), (p).toString(), (base).toString(), (p).toString(), (base).toString(), (p).toString(), (name).toString(), (p).toString(), (p).toString(), (p).toString(), (bridgeMatch[element]).toString(), (adrInt.toRadixString(16).toUpperCase().padLeft(8, '0')).toString(), (adrInt.toRadixString(16).toUpperCase()).toString(), (p).toString(), (adr).toString(), (ssdtName).toString(), (tableName).toString(), (tableName).toString(), (als[0][0]).toString(), (ssdtName).toString())
  DefinitionBlock ("", "SSDT", 2, "RAPID", "ALS0", 0x00000000)
  {
      External ([[als0_path]], DeviceObj)
      External ([[als0_path]].XSTA, [[sta_type]])

      Scope ([[als0_path]])
      {
          Method (_STA, 0, NotSerialized)
          {
              If (_OSI ("Darwin"))
              {
                  Return (0x0F)
              }
              Else
              {
                  Return ([[XSTA]])
              }
          }
      }
  }
l10nGlobal.msg_a85bd7((als[0][0]).toString(), (sta.containsKey("sta_type") && sta["sta_type"] == "MethodObj" ? " ()" : "").toString(), (sta["dev_name"]).toString(), (ssdtName).toString())//
// Original source from:
// https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/Source/SSDT-ALS0.dsl
//
DefinitionBlock ("", "SSDT", 2, "RAPID", "ALS0", 0x00000000)
{
    Scope (_SB)
    {
        Device (ALS0)
        {
            Name (_HID, "ACPI0008" /* Ambient Light Sensor Device */)  // _HID: Hardware ID
            Name (_CID, "smc-als")  // _CID: Compatible ID
            Name (_ALI, 0x012C)  // _ALI: Ambient Light Illuminance
            Name (_ALR, Package (0x01)  // _ALR: Ambient Light Response
            {
                Package (0x02)
                {
                    0x64, 
                    0x012C
                }
            })
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
}l10nGlobal.msg_39f687((ssdtName).toString(), (highestOsi).toString(), (osiStrings[highestOsi]).toString(), (targetString).toString(), (osiStrings[targetString]).toString(), (ssdtName).toString(), (targetString).toString(), (osiStrings[targetString]).toString(), (ssdtName).toString(), (targetString).toString(), (osiStrings[targetString]).toString(), (ssdtName).toString())
DefinitionBlock ("", "SSDT", 2, "RAPID", "XOSI", 0x00001000)
{
    Method (XOSI, 1, NotSerialized)
    {
        /* Edited from:
         * https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/decompiled/SSDT-XOSI.dsl
         * Based off of: 
         * https://docs.microsoft.com/en-us/windows-hardware/drivers/acpi/winacpi-osi#_osi-strings-for-windows-operating-systems
         * Add OSes from the below list as needed, most only check up to Windows 2015
         * but check what your DSDT looks for
         */
        Store (Package ()
        {
l10nGlobal.msg_ba43ba((osiString).toString(), (x).toString(), (x).toString())
        }, Local0)
        If (_OSI ("Darwin"))
        {
            Return (LNotEqual (Match (Local0, MEQ, Arg0, MTR, Zero, Zero), Ones))
        }
        Else
        {
            Return (_OSI (Arg0))
        }
    }
}l10nGlobal.msg_e063fa((osid[0][1]).toString(), (osid[0][0]).toString(), (ssdtName).toString(), (targetString).toString(), (ssdtName).toString(), (tableSignature).toString(), (1).toString(), (config.acpiDirectory).toString(), (tableSignature).toString(), (tableSignature).toString(), (tableSignature).toString(), (tableSignature).toString(), (tableSignature).toString(), (tableSignature).toString(), (valueToCauseReset).toString(), (valueToCauseReset).toString(), (valueToCauseReset).toString(), (valueToCauseReset).toString(), (valueCauseReset).toString(), (valueToCauseReset).toString(), (addressValue).toString(), (findAddrHeader).toString(), (valueCauseReset).toString(), (findAddrHeader).toString(), (findAddress).toString(), (replaceAddress).toString(), (line).toString(), (line).toString(), (tableName).toString(), (tableName).toString(), (tableName).toString(), (apicProcessorId).toString(), (processorId).toString(), (line).toString(), (ssdtName).toString(), (ssdtName).toString(), (res).toString(), (newVal).toString(), (regionCount).toString(), (ssdtName).toString(), (imei.busPath).toString(), (parent).toString(), (igpu.busPath).toString(), (parent).toString(), (fakeid).toString(), (fakeid).toString(), (ssdtName).toString())
//
// Original source from:
// https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/Source/SSDT-IMEI.dsl
//
DefinitionBlock ("", "SSDT", 2, "RAPID", "IMEI", 0x00000000)
{
    External ([[parent]], DeviceObj)

    Scope ([[parent]])
    {
        Device (IMEI)
        {
            Name (_ADR, 0x00160000)  // _ADR: Address
        }
    }
}
""";

      ssdt = ssdt.replaceAll('[[parent]]', parent);
    } else {
      ssdt = """
//
// Original source from:
// https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/Source/SSDT-IMEI.dsl
//
DefinitionBlock ("", "SSDT", 2, "RAPID", "IMEI", 0x00000000)
{
    External ([[parent]], DeviceObj)

    Scope ([[parent]])
    {
        Device (IMEI)
        {
            Name (_ADR, 0x00160000)  // _ADR: Address
            Method (_DSM, 4, NotSerialized)
            {
                If (LEqual (Arg2, Zero)) {
                    Return (Buffer (One) { 0x03 })
                }
                Return (Package (0x02)
                {
                    "device-id",
                    Buffer (0x04) { 0x3A, 0x1[[fake]], 0x00, 0x00 }
                })
            }
        }
    }
}
l10nGlobal.msg_1f9e9b((ssdtName).toString(), (devices.length).toString(), (i + 1).toString(), (devices[i].first).toString(), (devicePath).toString(), (devName).toString(), (devName).toString(), (2).toString(), (staIndex).toString(), (devName).toString(), (devName).toString(), (padl + staHex + padr).toString(), (padl + xstaHex + padr).toString(), (devName).toString(), (ssdtName).toString(), (path).toString(), (path).toString(), (devName).toString(), (devName).toString(), (devName).toString(), (devices.map((e) => e.first.split('.').last).join(', ')).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (tableName).toString(), (dtgp[0].first).toString(), (ssdtName).toString(), (ssdtName).toString(), (tableName).toString(), (device[0].first).toString()) 
    
    DefinitionBlock ("", "SSDT", 2, "RAPID", "DMAC", 0x00000000)
{
    External ([[LPC_PATH]], DeviceObj)

    Scope ([[LPC_PATH]])
    {
        Device (DMAC)
        {
            Name (_HID, EisaId ("PNP0200") /* PC-class DMA Controller */)  // _HID: Hardware ID
            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }

            Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
            {
                IO (Decode16,
                    0x0000,             // Range Minimum
                    0x0000,             // Range Maximum
                    0x01,               // Alignment
                    0x20,               // Length
                    )
                IO (Decode16,
                    0x0081,             // Range Minimum
                    0x0081,             // Range Maximum
                    0x01,               // Alignment
                    0x11,               // Length
                    )
                IO (Decode16,
                    0x0093,             // Range Minimum
                    0x0093,             // Range Maximum
                    0x01,               // Alignment
                    0x0D,               // Length
                    )
                IO (Decode16,
                    0x00C0,             // Range Minimum
                    0x00C0,             // Range Maximum
                    0x01,               // Alignment
                    0x20,               // Length
                    )
                DMA (Compatibility, NotBusMaster, Transfer8_16, )
                    {4}
            })
        }
    }
}
    
    l10nGlobal.msg_ab053e((ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (methodHex).toString(), (suffix).toString(), (renamedHex).toString(), (suffix).toString(), (tableName).toString(), (pts.first).toString(), (wak.first).toString(), (ssdtName).toString(), (_methodFlag(pts)).toString(), (_methodFlag(wak)).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (tableName).toString(), (sst[0].first).toString(), (ssdtName).toString(), (sstPath).toString(), (sstPath).toString(), (ssdtName).toString(), (tableName).toString(), (devicePath).toString(), (ssdtName).toString(), (devicePath).toString(), (devicePath).toString(), (ssdtName).toString(), (tableName).toString(), (systemState).toString(), (nameSystemState[0].first).toString(), (systemState).toString(), (methodSystemState[0].first).toString(), (systemState).toString(), (systemState).toString(), (systemStatesFound.join(", ")).toString(), (systemStatesNotSupported.join(", ")).toString(), (lowPower).toString(), (tableName).toString(), (target).toString(), (target).toString(), (target).toString(), (ssdtName).toString(), (externalLine).toString(), (ssdtBody).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (tableName).toString(), (device[0].first).toString(), (methodLID[0].first).toString(), (tts.first).toString(), (ztts.first).toString(), (ssdtName).toString(), (devicePath).toString(), (devicePath).toString(), (devicePath).toString(), (devicePath).toString(), (devicePath).toString(), (ssdtName).toString(), (ssdtName).toString(), (tableName).toString(), (device[0].first).toString(), (ssdtName).toString(), (ssdtName).toString(), (tableName).toString(), (devicePath).toString(), (devicePath).toString(), (devicePath).toString(), (devicePath).toString(), (ssdtName).toString(), (devicePath).toString(), (devicePath).toString(), (devicePath).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (tableName).toString(), (device[0].first).toString(), (ssdtName).toString(), (ssdtName).toString(), (xhciDevice[0][0]).toString(), (xhciDevice[0][0]).toString(), (xhciDevice[0][0]).toString(), (ssdtName).toString())
  /* Powers down the USB controller which is needed for proper shutdown.
 * When done incorrectly, macOS will not power down USB as it needs an
 * explicit call for S5 for proper shutdown procedure.
 * Do note this SSDT is called by SSDT-SleepHook from the unified _PTS hook.
 * Source for SSDT: Rehabman
 */

DefinitionBlock ("", "SSDT", 2, "RAPID", "PFSH", 0x00000000)
{
  """;

    for (String basePath in xhcis) {
      ssdt += '    External ($basePath.PMEE, FieldUnitObj)\n';
    }
    ssdt += '\n';

    ssdt += '''
    Method (PFSH, 1, NotSerialized)
    {
        If ((0x05 == Arg0))
        {  
            If (_OSI ("Darwin"))
              {
    ''';

    for (String basePath in xhcis) {
      ssdt += '            $basePath.PMEE = Zero \n';
    }

    ssdt += """
            }
        }
}
l10nGlobal.msg_9392af((ssdtName).toString(), (gprw[0][0]).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (uprw[0][0]).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (gpi0s[0].first).toString(), (gpioPath).toString(), (2).toString(), (staIndex).toString(), (gpioPath.split('.').last).toString(), (gpioPath.split('.').last).toString(), (padl + staHex + padr).toString(), (padl + xstaHex + padr).toString(), (gpioPath.split('.').last).toString(), (ssdtName).toString(), (devName).toString(), (devName).toString(), (devName).toString(), (devName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (tableName).toString(), (cpuName).toString(), (procs.length).toString(), (parent).toString(), (proc[0].split('.').last).toString(), (proc[0]).toString(), (uid0).toString(), (procList.length).toString())
DefinitionBlock ("", "SSDT", 2, "RAPID", "CPUR", 0x00003000)
{
""";

        for (var i = 0; i < procList.length; i++) {
          var procUid = procList[i];
          var proc = procUid["proc"];
          ssdt += "External ($proc, DeviceObj)";
        }

        ssdt += """
    Scope (\\_SB)
    {l10nGlobal.msg_563e64
        Processor ([[name]], [[uid]], 0x00000810, 0x06)
        {
            
             Return ($proc)
            
            """
                  .replaceAll(r"[[name]]", name)
                  .replaceAll(r"[[uid]]", uid ?? '')
                  .replaceAll(r"[[proc]]", proc ?? '');

          ssdt += """
        }""";
        }
        ssdt += """
    }
}l10nGlobal.msg_944f50((ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (fileName).toString(), (fileName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (fakeid).toString(), (fakeid).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (ssdtName).toString(), (pciPath).toString(), (pciPath).toString(), (pciPath).toString(), (pciPath).toString(), (pciPath).toString(), (pciPath).toString(), (pciPath).toString(), (pciPath).toString(), (pciPath).toString(), (pciPath).toString(), (pciPath).toString(), (type).toString(), (disableMethod).toString(), (ssdtName).toString(), (type).toString(), (pciPath).toString(), (disableMethod).toString(), (pciPath).toString(), (pciPath).toString(), (disableMethod).toString(), (type).toString(), (disableMethod).toString(), (ssdtName).toString(), (pciPath).toString(), (pciPath).toString(), (pciPath).toString(), (pciPath).toString(), (pciPath).toString(), (pciPath).toString(), (pciPath).toString(), (pciPath).toString(), (pciPath).toString(), (ioName).toString(), (ioName).toString(), (pciPath).toString(), (dsmMethod).toString(), (pciPath).toString(), (dsmMethod).toString(), (pciPath).toString(), (needBridge ? bridgeBody : normalBody).toString(), (method).toString(), (tableName).toString(), (pciPath).toString(), (method).toString(), (missing).toString(), (ssdtName).toString(), (ssdtName).toString(), (tableName).toString(), (adr?.toRadixString(16).toUpperCase().padLeft(8, '0')).toString(), (busPath).toString(), (ssdtName).toString())/*
 * SMBus compatibility table.
 * Original from: https://github.com/acidanthera/OpenCorePkg/blob/master/Docs/AcpiSamples/Source/SSDT-SBUS-MCHC.dsl
 */
DefinitionBlock ("", "SSDT", 2, "RAPID", "SBUSMCHC", 0x00000000)
{
    External ([[bus_parent]], DeviceObj)
    External ([[bus_parent]].MCHC, DeviceObj)
    External ([[bus_path]], DeviceObj)

    // Only create MCHC if it doesn't already exist
    If (LNot (CondRefOf ([[bus_parent]].MCHC)))
    {
        Scope ([[bus_parent]])
        {
            Device (MCHC)
            {
                Name (_ADR, Zero)  // _ADR: Address
                Method (_STA, 0, NotSerialized)  // _STA: Status
                {
                    If (_OSI ("Darwin"))
                    {
                        Return (0x0F)
                    }
                    Else
                    {
                        Return (Zero)
                    }
                }
            }
        }
    }

    Device ([[bus_path]].BUS0)
    {
        Name (_CID, "smbus")  // _CID: Compatible ID
        Name (_ADR, Zero)  // _ADR: Address

        /*
        * Uncomment replacing 0x57 with your own value which might be found
        * in SMBus section of Intel datasheet for your motherboard.
        *
        * The "diagsvault" is the diagnostic vault where messages are stored.
        * It's located at address 87 (0x57) on the SMBus controller.
        * While "diagsvault" may refer to diags, a hardware diagnosis program via EFI for Macs
        * that communicates with the SMBus controller, the effect is really unknown for hacks.
        * Uncomment this with caution.
        */

        /**
        Device (DVL0)
        {
            Name (_ADR, 0x57)  // _ADR: Address
            Name (_CID, "diagsvault")  // _CID: Compatible ID
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (!Arg2)
                {
                    Return (Buffer (One)
                    {
                        0x57                                             // W
                    })
                }

                Return (Package (0x02)
                {
                    "address", 
                    0x57
                })
            }
        }
        **/

        Method (_STA, 0, NotSerialized)  // _STA: Status
        {
            If (_OSI ("Darwin"))
            {
                Return (0x0F)
            }
            Else
            {
                Return (Zero)
            }
        }
    }
}l10nGlobal.msg_2be02d((ssdtName).toString(), (gpuPath).toString(), (gpuPath).toString(), (gpuPath).toString(), (gpuPath).toString(), (gpuPath).toString(), (gpuPath).toString(), (gpuPath).toString(), (deviceId).toString(), (ssdtName).toString(), (gpuPath).toString(), (deviceId).toString(), (fakeModel).toString())
    Method (_DSM, 4, NotSerialized)
    {
        If ((!Arg2 || !_OSI ("Darwin")))
        {
            Return (Buffer (One)
            {
              0x03                                         
            })
        }
        Return (Package (0x02)
        {
                "device-id", 
                Buffer (0x02)
                {
                  [[DEVICE_ID]]
                }, 
                [[MODEL_PACKAGE]]
        })
    }
  """;

    final dsmBlock = needBridge
        ? """
        Device (GFX0)
        {
            Name (_ADR, Zero)
            $dsmMethod
        }
      """
        : dsmMethod;

    String ssdt =
        """
    DefinitionBlock ("", "SSDT", 2, "RAPID", "GPUSPOOF", 0x00001000)
    {

        External ([[GPU_PATH]], DeviceObj)

        Scope ([[GPU_PATH]])
        {
            $dsmBlock
        }
    }
 """;

    ssdt = ssdt.replaceAll(r"[[GPU_PATH]]", gpuPath);
    ssdt = ssdt.replaceAll(
      r"[[DEVICE_ID]]",
      util.convertDeviceIdToSpoof(deviceId),
    );

    String modelPackage = "";
    if (fakeModel != null && fakeModel.isNotEmpty) {
      modelPackage = """
        "model", 
            Buffer ()
            {
                "[[MODEL]]"
            }
      """;
      modelPackage = modelPackage.replaceAll(r"[[MODEL]]", fakeModel);
    }
    ssdt = ssdt.replaceAll(r"[[MODEL_PACKAGE]]", modelPackage);

    final acpi = {
      "Comment": "GPU Spoof",
      "Enabled": true,
      "Path": "$ssdtName.amll10nGlobal.msg_59f5c7ACPI(", "")
        .replaceAll(")", "")
        .replaceAll("#", ".")
        .replaceAll("\\", "");

    List<String> newPath = [];
    const String valid = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_";
    for (var element in path.split(".")) {
      element = element.replaceAll(RegExp(r"_+$"), "").toUpperCase();
      if (element.length > 4 ||
          !element.split("l10nGlobal.msg_f58ac2=> found!");
      return (matchedPCIPath, adrOverflow);
    }
    matchedPCIPath = deviceDict[p]!['path'];
    Log("=> Matched PCI path: $matchedPCIPath");
    if (deviceDict[p]?["adr_overflow"] == true) {
      final overFlow = getAllMatches(deviceDict, deviceDict[p]?["path"]);
      List<dynamic> devs = [];
      for (var d in overFlow) {
        final devInfo = d.$2;
        if (devInfo["dev_overflow"] != null) {
          devs.addAll(devInfo["dev_overflow"]);
        }
      }
      if (devs.isNotEmpty) {
        Log.warning("device pathIn _ADR !");
        Log.warning("The following devices may affect property injection:");
        final uniqueSorted = devs.toSet().toList()..sort();
        for (var d in uniqueSorted) {
          Log.warning("=> $dl10nGlobal.msg_128c86((entry.key).toString(), (entry.key).toString(), (plistPath).toString(), (plistPath).toString())NormalizeHeaders":
              config.acpiMatchMode ==
              ACPIMatchMode.tableIDsAndLengthAndNormalizeHeaders,
        },
        replace,
        type,
      );
    } else {
      _prepareClover(
        plist,
        acpi,
        patches,
        drops,
        {
          "FixHeadersl10nGlobal.msg_7cd900((plistPath).toString(), (plistPath).toString())ACPI", "Add"]);
    ensurePath(plist, ["ACPI", "Patch"]);
    ensurePath(plist, ["ACPI", "Delete"]);
    ensurePath(plist, ["ACPI", "Quirks"], Map);

    _processSectionWrapper<Map<String, dynamic>>(
      plist: plist,
      type: type,
      keyPath: ["Add"],
      items: acpi,
      buildEntry: (s) => s,
      equalsEntry: (e, s) => e["Path"] == s["Path"],
      replace: replace,
      logCallback: (i) => i["Path"] ?? '',
    );
    _processSectionWrapper(
      plist: plist,
      type: type,
      keyPath: ["Patch"],
      items: patches,
      buildEntry: getOpenCorePatch,
      equalsEntry: (e, p) =>
          util.deepEquals(e["Find"], p["Find"]) &&
          util.deepEquals(e["Replace"], p["Replace"]),
      replace: replace,
      logCallback: (i) => i["Comment"],
    );
    _processSectionWrapper(
      plist: plist,
      type: type,
      keyPath: ["Delete"],
      items: drops,
      buildEntry: getOpenCoreDrop,
      equalsEntry: (e, d) =>
          util.deepEquals(e["TableSignature"], d["TableSignature"]) &&
          util.deepEquals(e["OemTableId"], d['OemTableId']),
      replace: replace,
      logCallback: (i) => i["Comment"],
    );
    _processSectionWrapper(
      plist: plist,
      type: type,
      keyPath: ["Quirks"],
      items: quirks ?? {},
      buildEntry: getOpenCoreQuirks,
      equalsEntry: (e, q) => e == q,
      replace: replace,
      logCallback: (i) => i.toString(),
    );
    _sortOpenCoreAcpiAddByDependencies(plist);
  }

  void _prepareClover(
    Map<String, dynamic> plist,
    Map<String, dynamic>? acpi,
    List<Map<String, dynamic>>? patches,
    List<Map<String, dynamic>>? drops,
    Map<String, dynamic>? quirks,
    bool replace,
    PlistType type,
  ) {
    final ensurePath = util.ensurePath;

    ensurePath(plist, ["ACPI", "SortedOrder"]);
    ensurePath(plist, ["ACPI", "DSDT", "Patches"]);
    ensurePath(plist, ["ACPI", "DropTables"]);

    _processSectionWrapper<String>(
      plist: plist,
      type: type,
      keyPath: ["SortedOrder"],
      items: acpi?["Path"],
      buildEntry: (s) => s,
      equalsEntry: (e, s) => e == s,
      replace: replace,
      logCallback: (i) => i,
    );
    _processSectionWrapper(
      plist: plist,
      type: type,
      keyPath: ["DSDT", "Patches"],
      items: patches,
      buildEntry: getCloverPatch,
      equalsEntry: (e, p) =>
          util.deepEquals(e["Find"], p["Find"]) &&
          util.deepEquals(e["Replace"], p["Replace"]),
      replace: replace,
      logCallback: (i) => i["Comment"],
    );
    _processSectionWrapper(
      plist: plist,
      type: type,
      keyPath: ["DropTables"],
      items: drops,
      buildEntry: getCloverDrop,
      equalsEntry: (e, d) =>
          e["Signature"] == d["Signature"] && e["TableId"] == d["TableId"],
      replace: replace,
      logCallback: (i) => "${i['Signature']} - ${i['Table']['id']}",
    );
    _processSectionWrapper(
      plist: plist,
      type: type,
      keyPath: ["l10nGlobal.msg_b39c00Mapl10nGlobal.msg_7ddc14map")) {
      return current.putIfAbsent(path.last, () => <String, dynamic>{})
          as Map<String, dynamic>;
    } else {
      return current.putIfAbsent(path.last, () => <dynamic>[]) as List<dynamic>;
    }
  }

  bool _isValidItem(Object? item) {
    return switch (item) {
      String s => s.isNotEmpty,
      Map m => m.isNotEmpty,
      List l => l.isNotEmpty,
      null => false,
      _ => true,
    };
  }

  String _plistName(PlistType type) =>
      type == PlistType.clover ? "patches_Clover.plist" : "patches_OC.plistl10nGlobal.msg_017883l10nGlobal.msg_4b767dACPI", ...keyPath]
    final effectivePath = (keyPath.length == 1 && keyPath.first.isEmpty)
        ? ["ACPI"]
        : ["ACPIl10nGlobal.msg_af6354((patchType).toString())$comment" to ${_plistName(type)}');
          } else {
            Log('=> $patchType "$commentl10nGlobal.msg_75559f((_plistName(type)).toString(), (patchType).toString())$commentl10nGlobal.msg_96ffbd((_plistName(type)).toString())$key" value is "$newValue" in ${_plistName(type)}');
                }
              } else {
                if (_lastACPIMatchMode != config.acpiMatchMode) {
                  Log('=> Key "$keyl10nGlobal.msg_75fb4d((_plistName(type)).toString())$key" value "$newValuel10nGlobal.msg_18a5ba((_plistName(type)).toString())ACPI", ...keyPath].join(".l10nGlobal.msg_fba121((section.runtimeType).toString())id" ? 8 : 4;
    List<int> zero = util.getHexBytes("00" * byteLength);

    dynamic rawValue;

    switch (mode) {
      case ACPIMatchMode.tableIDsAndLength:
        rawValue = table?[idName];
        break;
      case ACPIMatchMode.tableIDsAndLengthAndNormalizeHeaders:
        rawValue = table?["${idName}_asciil10nGlobal.msg_8c0509lengthl10nGlobal.msg_ceb16aComment": patch["Comment"],
      "Disabled": patch.containsKey("Disabled") ? patch["Disabled"] : false,
      "Find": getData(util.getHexBytes(patch["Find"])),
      "Replace": getData(util.getHexBytes(patch["Replace"])),
    };
  }

  Map<String, dynamic> getCloverDrop(Map<String, dynamic> drop) {
    final table = drop['Table'] ?? d.getDsdt();
    int leng = _getTableLength(table);
    Map<String, dynamic> t = {
      "Signature": table["signature"],
      "TableId": table["id"],
    };
    int length = drop['Length'] ?? leng;
    if (length > 0) {
      t["Lengthl10nGlobal.msg_12c2e7FixHeaders": quirks["FixHeadersl10nGlobal.msg_0d55d6Table"] ?? d.getDsdt();
    if (table == null || table.isEmpty) {
      table = {};
    }
    return {
      "Base": patch["Base"] ?? "",
      "BaseSkip": patch["BaseSkip"] ?? 0,
      "Comment": patch["Comment"],
      "Count": patch["Count"] ?? 0,
      "Enabled": patch.containsKey("Enabled") ? patch["Enabled"] : true,
      "Find": getData(util.getHexBytes(patch["Find"])),
      "Limit": patch["Limit"] ?? 0,
      "Mask": getData(patch['Mask']),
      "OemTableId": getData(
        patch['TableId'] ?? _getTableId(table, 'id'),
        padTo: 8,
      ),
      "Replace": getData(util.getHexBytes(patch["Replace"])),
      "ReplaceMask": getData(patch['ReplaceMask']),
      "Skip": patch["Skip"] ?? 0,
      "TableLength": patch["Length"] ?? _getTableLength(table),
      "TableSignaturel10nGlobal.msg_0a67dcTable"] ?? d.getDsdt();
    if (table == null || table.isEmpty) {
      table = {};
    }
    return {
      "All": drop["All"] ?? false,
      "Comment": drop["Comment"] ?? "",
      "Enabled": drop["Enabled"] ?? true,
      "OemTableId": getData(
        drop["TableId"] ?? _getTableId(table, 'id'),
        padTo: 8,
      ),
      "TableLength": drop["Length"] ?? _getTableLength(table),
      "TableSignature": getData(
        drop["Signaturel10nGlobal.msg_922b1cNormalizeHeaders": quirks["NormalizeHeaders"] ?? false};
  }
}
