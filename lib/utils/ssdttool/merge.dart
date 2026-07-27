//  merge.dart 
//  Created by JeoJay127 
//
import 'dart:convert';
import 'dart:io';
import 'package:rapidssdt/utils/log/log.dart';
import 'package:rapidssdt/utils/ssdttool/parser.dart';
import 'package:path/path.dart' as path;
import 'package:rapidssdt/utils/ssdttool/util.dart';
import 'config.dart';
import 'package:rapidssdt/l10n/l10n_helper.dart';

class PatchMerge {
  String? patchedPath;
  String? configPath;
  String? resultsFolder;
  bool overwrite;
  PlistParser plistParser = PlistParser();
  final String resultsFolderName = "Results";
  Util util = Util();
  final List<(PlistType, String)> targetPatches = [
    (PlistType.openCore, 'patches_OC.plist'),
    (PlistType.clover, 'patches_Clover.plist'),
  ];

  PatchMerge({this.patchedPath, this.configPath, this.overwrite = false});

  List<(String, bool, String)> _getPatchesPlists(String? plistDirectory) {
    List<(String, bool, String)> pathChecks = [];
    for (var (_, name) in targetPatches) {
      if (plistDirectory != null) {
        String p = path.join(plistDirectory, name);
        bool isFile = File(p).existsSync();
        pathChecks.add((p, isFile, name));
      } else {
        pathChecks.add(('', false, name));
      }
    }
    return pathChecks;
  }

  Future<String?> getDefaultResultsFolder() async {
    final String patchedPlistPath = patchedPath ?? '';
    String patchedResults = path.join(patchedPlistPath, resultsFolderName);
    List<String> potentials = [];
    for (String p in [patchedResults]) {
      if (Directory(p).existsSync()) {
        var pathInfoList = _getPatchesPlists(p);
        if (pathInfoList[0].$2 || pathInfoList[1].$2) {
          potentials.add(p);
        }
      }
    }

    if (potentials.isNotEmpty) {
      return potentials[0];
    }
    return await selectResultsFolder(patchedResults);
  }

  /// 选择并校验结果文件夹路径
  /// [resultsPath]：传入的结果路径
  Future<String?> selectResultsFolder(String resultsPath) async {
    try {
      // 处理异步路径检查
      final folderPath = await util.checkPath(filePath: resultsPath);
      if (folderPath.isEmpty) {
        Log.error("Path, Path");
        return null;
      }

      // 校验路径是否为有效的目录
      final directory = Directory(folderPath);
      if (!directory.existsSync()) {
        Log.warning("ACPIPathIn: $folderPath");
        return null;
      }

      // 检查目录下是否有目标plist文件
      final pathInfoList = _getPatchesPlists(folderPath);
      // 校验pathInfoList是否合法（避免空列表导致的索引越界）
      if (pathInfoList.length < 2) {
        Log.warning("plist, ");
        return null;
      }
      // 检查是否存在至少一个目标plist文件
      if (!(pathInfoList[0].$2 || pathInfoList[1].$2)) {
        Log.warning(
          l10nGlobal.msg_53d160((folderPath).toString()),
        );
        return null;
      }

      // 所有校验通过，返回有效路径
      return folderPath;
    } catch (e) {
      // 捕获所有异常
      Log.error("Path: $e");
      return null;
    }
  }

  (bool, String) getAsciiPrint(List<int> data) {
    bool unprintables = false;
    bool allZeroes = true;
    String asciiString = '';
    for (int b in data) {
      if (b != 0) {
        allZeroes = false;
      }
      if (32 <= b && b < 127) {
        asciiString += String.fromCharCode(b);
      } else {
        asciiString += '?';
        unprintables = true;
      }
    }
    return (allZeroes ? false : unprintables, asciiString);
  }

  bool checkNormalize(
    Map<String, dynamic> patchOrDrop,
    bool normalizeHeaders, {
    String checkType = 'Patch',
  }) {
    List<String> sig = ['OemTableId', 'TableSignature'];
    if (normalizeHeaders) {
      for (String key in sig) {
        var (unprintable, _) = getAsciiPrint(
          _extractData(patchOrDrop[key] ?? 0),
        );
        if (unprintable) {
          Log.warning('\n: NormalizeHeaders ,  ID !');
          Log.warning('$checkType !\n');
          return true;
        }
      }
    } else {
      for (String key in sig) {
        if (_extractData(patchOrDrop[key] ?? 0).contains(0x3F)) {
          Log.warning('\n: NormalizeHeaders ,  ID  \'?\' !');
          Log.warning('$checkType !\n');
          return true;
        }
      }
    }
    return false;
  }

  List<int> _extractData(dynamic data) {
    if (data is List<int>) {
      return data;
    } else if (data is String) {
      return utf8.encode(data);
    }
    return [];
  }

  String getUniqueName(
    String name,
    String targetFolder, [
    String nameAppend = '',
  ]) {
    name = path.basename(name);
    String ext = path.extension(name);
    if (ext.isNotEmpty) {
      name = name.substring(0, name.length - ext.length);
    }
    if (nameAppend.isNotEmpty) {
      name += nameAppend;
    }
    String checkName = ext.isNotEmpty ? '$name$ext' : name;
    if (!File(path.join(targetFolder, checkName)).existsSync()) {
      return checkName;
    }
    int num = 1;
    while (true) {
      checkName = ext.isNotEmpty ? '$name-$num$ext' : '$name-$num';
      if (!File(path.join(targetFolder, checkName)).existsSync()) {
        return checkName;
      }
      num++;
    }
  }

  Future<void> mergePlist() async {
    if (!validateConfigPath()) return;
    if (!await findResultsFolder()) return;

    var (plistType, configData, e) = getPlistInfo(configPath!);
    if (!handlePlistLoadingError(plistType, e)) return;
    Log('=> : ${plistType.value}');
    Log('=> configPath: $configPath');
    Log('=> Path: $resultsFolder');
    var pathInfo = getPatchPlistForType(resultsFolder!, plistType);
    if (!validatePatchFile(pathInfo)) return;
    var (_, targetData, e2) = getPlistInfo(pathInfo.$1);
    if (!handlePatchFileLoadingError(plistType, e2)) return;
    final resultMap = setupData(configData, targetData, plistType);

    handleSsdts(
      plistType,
      resultMap['ssdts'],
      resultMap['sOrig'],
      resultMap['errorsFound'],
    );
    handlePatches(
      plistType,
      resultMap['patch'],
      resultMap['pOrig'],
      resultMap['normalizeHeaders'],
      resultMap['errorsFound'],
    );
    handleDrops(
      plistType,
      resultMap['drops'],
      resultMap['dOrig'],
      resultMap['normalizeHeaders'],
      resultMap['errorsFound'],
    );
    handleQuirks(plistType, resultMap['quirks'], resultMap['quirksOrig']);
    saveConfig(plistType, configData, resultMap['errorsFound']);
  }

  bool validateConfigPath() {
    if (configPath == null) {
      Log.warning(' config.plist !');
      return false;
    }
    if (!File(configPath!).existsSync()) {
      Log.warning('found config.plist : $configPath');
      return false;
    }
    return true;
  }

  Future<bool> findResultsFolder() async {
    resultsFolder = await getDefaultResultsFolder();
    if (resultsFolder == null || resultsFolder!.isEmpty) {
      return false;
    }
    return true;
  }

  bool handlePlistLoadingError(PlistType plistType, dynamic e) {
    String configName = path.basename(configPath!);
    Log('In $configName...');
    if (e != null) {
      Log.error('=> !: $e \n');
      return false;
    }
    if (plistType == PlistType.unknown) {
      Log.warning('=>  config.plist !\n');
      return false;
    }
    return true;
  }

  bool validatePatchFile((String, bool, String) pathInfo) {
    if (!pathInfo.$2) {
      Log.error('foundPath ${pathInfo.$3} !Operation aborted!\n');
      return false;
    }
    if (!File(pathInfo.$1).existsSync()) {
      Log.error('found: ${pathInfo.$1}!Operation aborted!\n');
      return false;
    }
    String targetName = path.basename(pathInfo.$1);
    Log('In $targetName...');
    return true;
  }

  bool handlePatchFileLoadingError(PlistType plistType, dynamic e2) {
    if (e2 != null) {
      Log.error('=> !: $e2\n');
      return false;
    }
    String configName = path.basename(configPath!);
    String targetName = path.basename(
      getPatchPlistForType(resultsFolder!, plistType).$1,
    );
    Log('In $configName  $targetName Path...');
    return true;
  }

  Map<String, dynamic> setupData(
    dynamic configData,
    dynamic targetData,
    PlistType plistType,
  ) {
    bool errorsFound = false;
    dynamic normalizeHeaders;
    List<dynamic> ssdts = [];
    List<dynamic> patch = [];
    List<dynamic> drops = [];
    Map<dynamic, dynamic> quirks = {};
    List<dynamic> sOrig = [];
    List<dynamic> pOrig = [];
    List<dynamic> dOrig = [];
    Map<dynamic, dynamic> quirksOrig = {};
    final ensurePath = util.ensurePath;
    if (plistType == PlistType.openCore) {
      normalizeHeaders =
          configData['ACPI']['Quirks']['NormalizeHeaders'] ?? false;
      if (normalizeHeaders is! bool) {
        errorsFound = true;
        normalizeHeaders = false;
      }
      ssdts = ensurePath(targetData, ["ACPI", "Add"], List);
      patch = ensurePath(targetData, ["ACPI", "Patch"], List);
      drops = ensurePath(targetData, ["ACPI", "Delete"], List);
      quirks = ensurePath(targetData, ["ACPI", "Quirks"], Map);
      sOrig = ensurePath(configData, ["ACPI", "Add"], List);
      pOrig = ensurePath(configData, ["ACPI", "Patch"], List);
      dOrig = ensurePath(configData, ["ACPI", "Delete"], List);
      quirksOrig = ensurePath(configData, ["ACPI", "Quirks"], Map);
    } else {
      ssdts = ensurePath(targetData, ["ACPI", "SortedOrder"], List);
      patch = ensurePath(targetData, ["ACPI", "DSDT", "Patches"], List);
      drops = ensurePath(targetData, ["ACPI", "DropTables"], List);
      quirks = ensurePath(targetData, ["ACPI"], Map);
      sOrig = ensurePath(configData, ["ACPI", "SortedOrder"], List);
      pOrig = ensurePath(configData, ["ACPI", "DSDT", "Patches"], List);
      dOrig = ensurePath(configData, ["ACPI", "DropTables"], List);
      quirksOrig = ensurePath(configData, ["ACPI"], Map);
    }

    return {
      'ssdts': ssdts,
      'patch': patch,
      'drops': drops,
      'quirks': quirks,
      'sOrig': sOrig,
      'pOrig': pOrig,
      'dOrig': dOrig,
      'quirksOrig': quirksOrig,
      'normalizeHeaders': normalizeHeaders,
      'errorsFound': errorsFound,
    };
  }

  void handleSsdts(
    PlistType plistType,
    List<dynamic> ssdts,
    List<dynamic> sOrig,
    bool errorsFound,
  ) {
    Log('');
    if (ssdts.isEmpty) {
      Log.warning('=> found SSDT !skipping...');
      return;
    }
    Log('=> In SSDT ( ${ssdts.length} )...');
    List<dynamic> sRem = [];
    List<dynamic> sBroken = plistType == PlistType.openCore
        ? sOrig.where((x) => x is! Map).toList()
        : [];
    for (var s in ssdts) {
      if (plistType == PlistType.openCore) {
        Log('=> In ${s['Path']}...');
        List<dynamic> existing = sOrig
            .where((x) => x is Map && x['Path'] == s['Path'])
            .toList();
        if (existing.isNotEmpty) {
          Log('=> Found ${existing.length}  SSDT , ...');
          sRem.addAll(existing);
        }
      } else {
        Log('=> In $s...');
        List<dynamic> existing = sOrig.where((x) => x == s).toList();
        if (existing.isNotEmpty) {
          Log('=> Found ${existing.length}  SSDT , ...');
          sRem.addAll(existing);
        }
      }
    }
    if (sRem.isNotEmpty) {
      Log('=> In ${sRem.length}  SSDT ...');
      for (var r in sRem) {
        sOrig.remove(r);
      }
    } else {
      Log('=> found SSDT !');
    }
    Log('=> InAdding ${ssdts.length}  SSDT ...');
    sOrig.addAll(ssdts);
    if (sBroken.isNotEmpty) {
      errorsFound = true;
      Log.error(
        l10nGlobal.msg_a2bd26((sBroken.length).toString(), (path.basename(configPath!)).toString()),
      );
    }
  }

  void handlePatches(
    PlistType plistType,
    List<dynamic> patch,
    List<dynamic> pOrig,
    dynamic normalizeHeaders,
    bool errorsFound,
  ) {
    Log('');
    if (patch.isEmpty) {
      Log('=> found Patch !skipping...');
      return;
    }
    Log('=> In Patch ( ${patch.length} )...');
    List<dynamic> pRem = [];
    List<dynamic> pBroken = pOrig.where((x) => x is! Map).toList();
    for (var p in patch) {
      Log('=> In ${p['Comment']}...');
      if (plistType == PlistType.openCore &&
          checkNormalize(p, normalizeHeaders)) {
        errorsFound = true;
      }
      List<dynamic> existing = pOrig
          .where(
            (x) =>
                x is Map &&
                util.deepEquals(x['Find'], p['Find']) &&
                util.deepEquals(x['Replace'], p['Replace']),
          )
          .toList();
      if (existing.isNotEmpty) {
        Log('=> Found ${existing.length}  Patch , ...');
        pRem.addAll(existing);
      }
    }
    if (pRem.isNotEmpty) {
      Log('=> In ${pRem.length}  Patch ...');
      for (var r in pRem) {
        pOrig.remove(r);
      }
    } else {
      Log('=> found Patch !');
    }
    Log('=> InAdding ${patch.length}  Patch ...');
    pOrig.addAll(patch);
    if (pBroken.isNotEmpty) {
      errorsFound = true;
      Log.error(
        l10nGlobal.msg_3228ab((pBroken.length).toString(), (path.basename(configPath!)).toString()),
      );
    }
  }

  void handleDrops(
    PlistType plistType,
    List<dynamic> drops,
    List<dynamic> dOrig,
    dynamic normalizeHeaders,
    bool errorsFound,
  ) {
    Log('');
    if (drops.isEmpty) {
      Log('=> found Drop !skipping...');
      return;
    }
    Log('=> In Drop ( ${drops.length} )...');
    List<dynamic> dRem = [];
    List<dynamic> dBroken = dOrig.where((x) => x is! Map).toList();
    for (var d in drops) {
      if (plistType == PlistType.openCore) {
        Log('=> In ${d['Comment']}...');
        if (checkNormalize(d, normalizeHeaders, checkType: 'Dropped table')) {
          errorsFound = true;
        }
        List<dynamic> existing = dOrig
            .where(
              (x) =>
                  x is Map &&
                  util.deepEquals(x['TableSignature'], d['TableSignature']) &&
                  util.deepEquals(x['OemTableId'], d['OemTableId']),
            )
            .toList();
        if (existing.isNotEmpty) {
          Log('=> Found ${existing.length}  Drop , ...');
          dRem.addAll(existing);
        }
      } else {
        String name = [
          d['Signature'] ?? '',
          d['TableId'] ?? '',
        ].where((x) => x.isNotEmpty).join(' - ');
        Log('=> In $name...');
        List<dynamic> existing = dOrig
            .where(
              (x) =>
                  x is Map &&
                  util.deepEquals(x['Signature'], d['Signature']) &&
                  util.deepEquals(x['TableId'], d['TableId']),
            )
            .toList();
        if (existing.isNotEmpty) {
          Log('=> Found ${existing.length}  Drop , ...');
          dRem.addAll(existing);
        }
      }
    }
    if (dRem.isNotEmpty) {
      Log('=> In ${dRem.length}  Drop ...');
      for (var r in dRem) {
        dOrig.remove(r);
      }
    } else {
      Log('=> found Drop !');
    }
    Log('=> InAdding ${drops.length}  Drop ...');
    dOrig.addAll(drops);
    if (dBroken.isNotEmpty) {
      errorsFound = true;
      Log.error(
        l10nGlobal.msg_0c2635((dBroken.length).toString(), (path.basename(configPath!)).toString()),
      );
    }
  }

  void handleQuirks(
    PlistType plistType,
    Map<dynamic, dynamic> quirks,
    Map<dynamic, dynamic> quirksOrig,
  ) {
    Log('');
    if (quirks.isEmpty) {
      Log('=> foundUpdating Quirks !skipping...');
      return;
    }
    Log('=> In Quirks ...');
    for (var q in quirks.entries) {
      if (q.value is bool) {
        Log('=> Updating ${q.key}  ${q.value}');
        quirksOrig[q.key] = quirks[q.key];
      }
    }
  }

  String _generateBackupFileName(String originalPath) {
    final directory = path.dirname(originalPath);
    final fileName = path.basenameWithoutExtension(originalPath);
    final extension = path.extension(originalPath);

    int counter = 1;
    String backupFileName;
    String backupPath;

    do {
      backupFileName = '$fileName-backup-$counter$extension';
      backupPath = path.join(directory, backupFileName);
      counter++;
    } while (File(backupPath).existsSync());

    return backupPath;
  }

  void backupConfig(String configPath) {
    Log('Inconfig...');
    String backupPath = _generateBackupFileName(configPath);
    File(configPath).copySync(backupPath);
    Log('to: $backupPath');
  }

  String resolveOutputPath() {
    if (overwrite) {
      return configPath!;
    }
    return path.join(resultsFolder!, path.basename(configPath!));
  }

  Future<void> copyAmlFiles(PlistType plistType, String configPath) async {
    Log(' SSDT ...');

    String acpiPath = path.join(path.dirname(configPath), 'ACPI');
    if (plistType == PlistType.clover) {
      acpiPath = path.join(acpiPath, 'patched');
    }

    String? results = await getDefaultResultsFolder();

    if (Directory(acpiPath).existsSync()) {
      if (results != null && Directory(results).existsSync()) {
        Directory(results).listSync().forEach((element) {
          if (element.path.endsWith('.aml')) {
            Log('In " ${path.basename(element.path)} " to $acpiPath ...');
            File(
              element.path,
            ).copySync(path.join(acpiPath, path.basename(element.path)));
          }
        });
      } else {
        Log('found: $results');
      }
    } else {
      Log('found: $acpiPath');
      Log(' $results  .aml ,to $acpiPath !');
    }
  }

  bool savePlist(String outputPath, dynamic configData) {
    final bool success = plistParser.savePlist(
      outputPath,
      configData,
      onError: (error) => Log.error(error),
    );

    if (success) {
      Log('!');
      Log('!\n');
    } else {
      Log.error('!\n');
    }

    return success;
  }

  void logWarningsAndErrors(bool success, bool errorsFound) {
    if (errorsFound) {
      Log.error(': In,!');
    } else {
      if (!overwrite) {
        final outputDir = path.dirname(resolveOutputPath());
        final efiDir = path.dirname(configPath!);
        final acpiDir = path.join(path.dirname(configPath!), 'ACPI');
        Log.warning(': EFI!');
        Log.warning(':');
        Log.warning('1.  $outputDir  config.plist to $efiDir !');
        Log.warning('2.  $outputDir  .aml ,to $acpiDir !');
      }
    }
  }

  void saveConfig(
    PlistType plistType,
    dynamic configData,
    bool errorsFound,
  ) async {
    Log('');
    if (overwrite) {
      backupConfig(configPath!);
      await copyAmlFiles(plistType, configPath!);
    }

    final String outputPath = resolveOutputPath();
    Log('IntoPath: $outputPath...');
    final bool success = savePlist(outputPath, configData);
    logWarningsAndErrors(success, errorsFound);
  }

  (PlistType, Map<String, dynamic>, dynamic) getPlistInfo(String configPath) {
    try {
      PlistParseResult configData = plistParser.loadPlist(configPath);
      if (configData.status != PlistParseStatus.success) {
        return (PlistType.unknown, configData.data ?? {}, null);
      }
      final data = configData.data ?? {};
      PlistType plistType = PlistType.unknown;
      if (_hasCloverFeatures(data)) {
        plistType = PlistType.clover;
      } else if (_hasOpenCoreFeatures(data)) {
        plistType = PlistType.openCore;
      }

      return (plistType, data, null);
    } catch (e) {
      return (PlistType.unknown, {}, e);
    }
  }

  bool _hasCloverFeatures(Map<String, dynamic> data) {
    final acpi = data['ACPI'] as Map<String, dynamic>?;
    return (acpi?.containsKey('SortedOrder') ?? false) ||
        (acpi?.containsKey('DSDT') ?? false) ||
        (acpi?.containsKey('DropTables') ?? false) ||
        data.containsKey('SMBIOS');
  }

  bool _hasOpenCoreFeatures(Map<String, dynamic> data) {
    final acpi = data['ACPI'] as Map<String, dynamic>?;
    return (acpi?.containsKey('Add') ?? false) ||
        (acpi?.containsKey('Patch') ?? false) ||
        (acpi?.containsKey('Delete') ?? false) ||
        data.containsKey('PlatformInfo');
  }

  (String, bool, String) getPatchPlistForType(
    String path,
    PlistType plistType,
  ) {
    var pathInfoList = _getPatchesPlists(path);
    return plistType == PlistType.openCore ? pathInfoList[0] : pathInfoList[1];
  }
}
