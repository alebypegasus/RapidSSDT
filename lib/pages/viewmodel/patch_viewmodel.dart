//  patch_viewmodel.dart
//  Created by JeoJay127
//
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:rapidssdt/pages/model/ssdt_category.dart';
import 'package:rapidssdt/pages/model/patch_state.dart';
import 'package:rapidssdt/pages/viewmodel/patch_config.dart';
import 'package:rapidssdt/utils/ssdttool/config.dart';
import 'package:rapidssdt/utils/ssdttool/manager.dart';
import 'package:path/path.dart' as path;
import 'package:rapidssdt/utils/ssdttool/table.dart';
import 'package:rapidssdt/l10n/l10n_helper.dart';

class PatchViewModel extends ChangeNotifier {
  // 状态管理
  final ValueNotifier<PatchState> _state = ValueNotifier(
    PatchState(selectedCategory: 'corePatches', selectedHpet: 'C'),
  );
  late Map<String, PatchConfig> _patchConfigs;
  ValueNotifier<PatchState> get state => _state;
  Map<String, PatchConfig> get patchConfigs => _patchConfigs;
  String get desktopDirectory => _desktopDirectory;
  bool get isRunningPatches => _isRunningPatches;

  bool _isDumping = false;
  bool _isRunningPatches = false;
  final ACPIToolManager manager;
  // 补丁分类常量
  final List<Map<String, dynamic>> patchCategories =
      SsdtCategory.patchCategories;
  // 桌面目录
  late String _desktopDirectory;
  // ACPI 偏好配置
  late ValueNotifier<AcpiConfig> acpiConfig;
  AcpiConfig get config => acpiConfig.value;

  PatchViewModel({AcpiConfig? acpiconfig, ACPIToolManager? manager})
    : acpiConfig = ValueNotifier(acpiconfig ?? AcpiConfig()),
      manager = manager ?? ACPIToolManager(acpiConfig: acpiconfig) {
    _initOutputDir();
    _initPatchConfigs();
  }

  void updateConfig(
    AcpiConfig newConfig, {
    Function(String)? onError,
    Function(String)? onLog,
  }) {
    final old = acpiConfig.value;
    // ACPI工具校验（local, legacy）
    if (old.useLocaliAsl != newConfig.useLocaliAsl ||
        old.useLeagcyiAsl != newConfig.useLeagcyiAsl) {
      checkIaslValid(
        local: newConfig.useLocaliAsl,
        legacy: newConfig.useLeagcyiAsl,
        onError: (err) => onError?.call(err),
      );
    }

    // 删除dsl
    if (old.deleteDsl != newConfig.deleteDsl) {
      onLog?.call(l10nGlobal.ssdtMsg511(newConfig.deleteDsl ? l10nGlobal.ssdtMsg545 : l10nGlobal.ssdtMsg546.toString()));
    }

    // 强制编译
    if (old.force != newConfig.force) {
      onLog?.call(l10nGlobal.ssdtMsg512(newConfig.force ? l10nGlobal.ssdtMsg547 : l10nGlobal.ssdtMsg548.toString()));
    }
    // 覆盖EFI
    if (old.overwriteEFI != newConfig.overwriteEFI) {
      onLog?.call(l10nGlobal.ssdtMsg513(newConfig.overwriteEFI ? l10nGlobal.ssdtMsg549 : l10nGlobal.ssdtMsg550.toString()));
    }

    // 匹配模式
    if (old.acpiMatchMode != newConfig.acpiMatchMode) {
      onLog?.call(l10nGlobal.ssdtMsg514(newConfig.acpiMatchMode.value.toString()));
    }

    acpiConfig.value = newConfig;
    manager.acpiConfig = acpiConfig.value.copyWith(
      useLocaliAsl: newConfig.useLocaliAsl,
      deleteDsl: newConfig.deleteDsl,
      useLeagcyiAsl: newConfig.useLeagcyiAsl,
      force: newConfig.force,
      overwriteEFI: newConfig.overwriteEFI,
      acpiMatchMode: newConfig.acpiMatchMode,
      outputDirectory:
          newConfig.outputDirectory ?? manager.acpiConfig.outputDirectory,
      acpiDirectory:
          newConfig.acpiDirectory ?? manager.acpiConfig.acpiDirectory,
    );
  }

  /// 初始化补丁配置（从manager的动作列表生成）
  void _initPatchConfigs() {
    _patchConfigs = {
      for (final action in manager.actionKeys) action: PatchConfig(),
    };
  }

  /// 初始化默认输出目录（Desktop/ACPIs）
  void _initOutputDir() {
    _desktopDirectory = manager.getDesktopDirectory();
    _updateOutputDirectory(null);
  }

  void _updateOutputDirectory(String? dir, {bool updateAcpiDir = false}) {
    final targetDir = _resolveValidOutputDir(dir);
    manager.acpiConfig = manager.acpiConfig.copyWith(
      outputDirectory: targetDir,
      acpiDirectory: updateAcpiDir
          ? targetDir
          : manager.acpiConfig.acpiDirectory,
    );
    _updateState(outputDir: targetDir);
  }

  String _resolveValidOutputDir(String? dir) {
    if (dir != null && dir.trim().isNotEmpty) {
      return dir;
    }

    return path.join(_desktopDirectory, 'ACPIs');
  }

  /// 加载HPET中断数据
  Future<void> _loadHpetData() async {
    final devs = _state.value.patchContext.devs;
    if (devs == null || devs.isEmpty) return;

    try {
      final (irqs, legacyIrqs) = manager.ssdt.getIrqChoice(
        devs,
        selectedOption: _state.value.selectedHpet,
      );

      // 仅在数据变化时更新状态（减少无效重绘）
      final currentState = _state.value;
      if (!mapEquals(currentState.patchContext.targetIrqs, irqs) ||
          !listEquals(currentState.legacyIrqs, legacyIrqs)) {
        _updateState(
          patchContext: currentState.patchContext.copyWith(targetIrqs: irqs),
          legacyIrqs: legacyIrqs,
        );
      }
    } catch (e) {
      debugPrint(l10nGlobal.ssdtMsg515(e.toString()));
      _updateState(
        patchContext: _state.value.patchContext.copyWith(targetIrqs: {}),
        legacyIrqs: [],
      );
    }
  }

  /// 初始化HPET设备与中断数据
  Future<void> _initHpetData() async {
    try {
      final devs = await manager.ssdt.listIrqs();
      final currentState = _state.value;

      // 更新设备列表状态
      _updateState(
        patchContext: currentState.patchContext.copyWith(devs: devs),
      );

      if (devs.isNotEmpty) {
        _updateState(selectedHpet: 'C'); // 默认选中Hpet C
        await _loadHpetData();
      }

      // 更新SSDT-HPET配置可见性（仅当前选中时）
      final hpetConfig = _patchConfigs[ACPITable.ssdtHPET.name];
      if (hpetConfig != null &&
          currentState.selectedAction.name == ACPITable.ssdtHPET.name) {
        hpetConfig.isVisible.value =
            devs.isNotEmpty &&
            (currentState.tablePath != null || currentState.dsdtPath != null);
      }
    } catch (e) {
      debugPrint(l10nGlobal.ssdtMsg516(e.toString()));
      _updateState(patchContext: _state.value.patchContext.copyWith(devs: {}));
    }
  }

  /// 初始化目标ACPI表路径
  void _initTargetSSDTPath() {
    try {
      const Map<String, String> tableSignatureMap = {
        'SSDT-APIC': 'APIC',
        'SSDT-DMAR': 'DMAR',
        'SSDT-FACP': 'FACP',
        'Check-AOAC': 'FACP', // 特殊映射
      };

      tableSignatureMap.forEach((table, tableSignature) {
        final targetPath = manager.getSSDTPathWithSignature(tableSignature);
        _patchConfigs[table]?.data.value = targetPath;
      });
    } catch (e) {
      debugPrint(l10nGlobal.ssdtMsg517(e.toString()));
    }
  }

  /// 获取选中补丁的说明文本
  String getActionNote() {
    try {
      final currentState = _state.value;
      // 查找当前分类
      final category = patchCategories.firstWhere(
        (c) => c.name == currentState.selectedCategory,
        orElse: () => <String, Object>{'actions': []},
      );
      final actions = category['actions'] as List;
      if (actions.isEmpty) return l10nGlobal.ssdtMsg518;

      final action = actions.firstWhere(
        (a) => a['name'] == currentState.selectedAction.name,
        orElse: () => {'note': l10nGlobal.ssdtMsg519},
      );
      return action['note'] as String;
    } catch (e) {
      debugPrint(l10nGlobal.ssdtMsg520(e.toString()));
      return l10nGlobal.ssdtMsg521;
    }
  }

  /// 更新补丁配置的可见性
  void updatePatchVisibility(
    Map<String, dynamic> selectedAction,
    bool prebuilt,
  ) {
    _updateState(selectedAction: selectedAction);
    final currentState = _state.value;

    for (final entry in _patchConfigs.entries) {
      bool visible = (entry.key == selectedAction.name) && !prebuilt;
      // SSDT-HPET需额外校验路径
      if (entry.key == ACPITable.ssdtHPET.name) {
        visible =
            visible &&
            (currentState.tablePath != null || currentState.dsdtPath != null);
      }
      entry.value.isVisible.value = visible;
    }
  }

  void updatePatchConfigPath(
    String action,
    String? newPath, {
    Function(String)? onError,
  }) {
    // 路径为空时，仅清空配置，不更新输出目录
    if (newPath == null || newPath.trim().isEmpty) {
      _patchConfigs[action]?.data.value = null;
      onError?.call(l10nGlobal.ssdtMsg522(action.toString()));
      return;
    }

    // 校验路径是否为文件（避免传入目录导致 dirname 异常）
    if (!FileSystemEntity.isFileSync(newPath)) {
      onError?.call(l10nGlobal.ssdtMsg523(action.toString(), newPath.toString()));
      _patchConfigs[action]?.data.value = null;
      return;
    }

    final config = _patchConfigs[action];
    if (config != null) {
      config.data.value = newPath;
      final fileDir = path.dirname(newPath);
      _updateOutputDirectory(fileDir, updateAcpiDir: true);
    } else {
      onError?.call(l10nGlobal.ssdtMsg524(action.toString()));
    }
  }

  /// 重置补丁状态（切换分类/页面时调用）
  void resetPatchStates({String? catName}) {
    _updateState(selectedCategory: catName ?? 'corePatches', selectedAction: {});

    // 重置所有配置可见性
    for (final config in _patchConfigs.values) {
      config.isVisible.value = false;
    }
  }

  /// 处理Legacy IRQ变更
  Future<void> handleLegacyIrqsChange(String irq) async {
    if (irq.isEmpty) {
      _updateState(
        patchContext: _state.value.patchContext.copyWith(targetIrqs: {}),
      );
      return;
    }

    _updateState(selectedHpet: irq);
    await _loadHpetData();
  }

  /// 执行单个补丁（对外入口）
  void runPatch(
    Map<String, dynamic> action, {
    bool prebuilt = false,
    Function(String)? onError,
  }) {
    if (action.isEmpty) {
      onError?.call(l10nGlobal.ssdtMsg525);
      return;
    }

    try {
      final newContext = _basePatchContext(prebuilt);
      _updateState(patchContext: newContext);
      _runPatch(action, newContext, onError);
    } catch (e) {
      onError?.call(l10nGlobal.ssdtMsg526(e.toString()));
    }
  }

  PatchContext _basePatchContext(bool prebuilt) {
    final current = _state.value.patchContext;
    return PatchContext(
      devs: current.devs,
      targetIrqs: current.targetIrqs,
      prebuilt: prebuilt,
    );
  }

  PatchContext _contextForAction(
    Map<String, dynamic> action,
    PatchContext baseContext,
  ) {
    return PatchContext(
      data: _patchConfigs[action.name]?.data.value,
      devs: baseContext.devs,
      targetIrqs: baseContext.targetIrqs,
      prebuilt: baseContext.prebuilt,
    );
  }

  /// 执行单个补丁（内部实现）
  void _runPatch(
    Map<String, dynamic> action,
    PatchContext context,
    Function(String)? onError,
  ) {
    try {
      manager.runPatch(
        action,
        context: _contextForAction(action, context),
        onError: onError,
      );
    } catch (e) {
      onError?.call(l10nGlobal.ssdtMsg527(action.toString(), e.toString()));
    }
  }

  /// 批量执行补丁
  Future<void> runPatches(
    List<Map<String, dynamic>> actions, {
    bool prebuilt = false,
    String? outputFolder,
    Function(String)? onError,
  }) async {
    if (_isRunningPatches) {
      onError?.call(l10nGlobal.ssdtMsg528);
      return;
    }

    if (actions.isEmpty) {
      onError?.call(l10nGlobal.ssdtMsg529);
      return;
    }

    _isRunningPatches = true;
    try {
      final context = _basePatchContext(prebuilt);
      if (prebuilt) {
        await manager.runPatches(
          actions,
          context: context,
          contextForAction: _contextForAction,
          outputFolder: outputFolder,
          onError: onError,
        );
        return;
      }

      await manager.runPatchBatch(() async {
        await manager.runPatches(
          actions,
          context: context,
          contextForAction: _contextForAction,
          outputFolder: outputFolder,
          onError: onError,
          copyToResults: false,
        );
      });

      if (outputFolder != null) {
        await manager.copyPatchOutputToResults(outputFolder);
      }
    } finally {
      _isRunningPatches = false;
    }
  }

  /// 检查IASL工具有效性
  void checkIaslValid({bool? local, bool? legacy, Function(String)? onError}) {
    if (legacy == true) {
      onError?.call(manager.ssdt.legacyWarning);
    }
    manager.ssdt.checkIaslValid(local: local, legacy: legacy);
  }

  /// 提取ACPI表并加载补丁
  Future<void> dumpTablesAndLoadPatches({
    Function(String)? onError,
    Function(String)? onSuccess,
    Future<String?> Function()? onRequestSudoPassword,
  }) async {
    if (_isDumping) {
      onError?.call(l10nGlobal.ssdtMsg530);
      return;
    }

    _isDumping = true;

    // 提取ACPI表
    try {
      if (Platform.isMacOS) {
        onError?.call(
          l10nGlobal.ssdtMsg531(Platform.operatingSystem.toString()),
        );
      }
      final currentState = _state.value;
      final dumpPath = await manager.dumpTables(
        currentState.outputDir,
        onRequestSudoPassword: onRequestSudoPassword,
      );
      if (dumpPath == null) {
        onError?.call(l10nGlobal.ssdtMsg532);
        return;
      }

      _updateState(dumpPath: dumpPath);
      final loadResult = await manager.loadTables(dumpPath);
      if (loadResult != null && loadResult.isNotEmpty) {
        onSuccess?.call(l10nGlobal.ssdtMsg533);
        _updateOutputDirectory(loadResult, updateAcpiDir: true);
        _updateState(tablePath: dumpPath, dsdtPath: null);
        _initTargetSSDTPath();
        await _initHpetData();
      }
    } catch (e) {
      onError?.call(l10nGlobal.ssdtMsg534(e.toString()));
    } finally {
      _isDumping = false;
    }
  }

  /// 加载外部ACPI/DSDT文件
  Future<void> loadTables({
    required String selectedPath,
    Function(String)? onError,
  }) async {
    try {
      final isFile = FileSystemEntity.isFileSync(selectedPath);
      final directory = isFile
          ? Directory(selectedPath).parent.path
          : selectedPath;

      // 更新输出目录并加载文件
      _updateState(outputDir: directory);
      final loadResult = await manager.loadTables(selectedPath);
      if (loadResult != null && loadResult.isNotEmpty) {
        _updateOutputDirectory(loadResult, updateAcpiDir: true);
        _updateState(
          tablePath: isFile ? selectedPath : directory,
          dsdtPath: isFile ? selectedPath : null,
        );
        _initTargetSSDTPath();
        await _initHpetData();
      }
    } catch (e) {
      onError?.call(l10nGlobal.ssdtMsg535(e.toString()));
    }
  }

  /// 获取plist文件类型
  String? getPlistType(
    String plistPath, {
    Function(String)? onSuccess,
    Function(String)? onError,
  }) {
    try {
      if (!File(plistPath).existsSync()) {
        onError?.call(l10nGlobal.ssdtMsg536(plistPath.toString()));
        return null;
      }

      final plistType = manager.getPlistType(plistPath);
      if (plistType == null) {
        onError?.call(l10nGlobal.ssdtMsg537);
        return null;
      }

      onSuccess?.call(l10nGlobal.ssdtMsg538(plistType.toString()));
      return plistType;
    } catch (e) {
      onError?.call(l10nGlobal.ssdtMsg539(e.toString()));
      return null;
    }
  }

  /// 合并plist文件（ACPI配置与config.plist整合）
  Future<void> mergePlist({Function(String)? onError}) async {
    try {
      final currentState = _state.value;

      // 校验必要参数
      if (currentState.tablePath == null) {
        onError?.call(l10nGlobal.ssdtMsg540);
        return;
      }
      if (currentState.configPath == null) {
        onError?.call(l10nGlobal.ssdtMsg541);
        return;
      }
      if (!Directory(currentState.tablePath!).existsSync() &&
          !File(currentState.tablePath!).existsSync()) {
        onError?.call(l10nGlobal.ssdtMsg542(currentState.tablePath.toString()));
        return;
      }
      if (!File(currentState.configPath!).existsSync()) {
        onError?.call(l10nGlobal.ssdtMsg543(currentState.configPath.toString()));
        return;
      }

      // 执行合并操作
      await manager.mergePlist(
        currentState.outputDir,
        currentState.configPath!,
        overwrite: config.overwriteEFI,
      );
    } catch (e) {
      onError?.call(l10nGlobal.ssdtMsg544(e.toString()));
    }
  }

  /// 更新配置文件路径（如config.plist）
  void updateConfigPath(String? newPath) {
    _updateState(configPath: newPath);
  }

  void _updateState({
    String? selectedCategory,
    Map<String, dynamic>? selectedAction,
    String? dumpPath,
    String? dsdtPath,
    String? tablePath,
    String? configPath,
    String? outputDir,
    String? selectedHpet,
    List<String>? legacyIrqs,
    PatchContext? patchContext,
  }) {
    _state.value = _state.value.copyWith(
      selectedCategory: selectedCategory,
      selectedAction: selectedAction,
      dumpPath: dumpPath,
      dsdtPath: dsdtPath,
      tablePath: tablePath,
      configPath: configPath,
      outputDir: outputDir,
      selectedHpet: selectedHpet,
      legacyIrqs: legacyIrqs,
      patchContext: patchContext,
    );
  }

  @override
  void dispose() {
    // 释放所有PatchConfig资源
    for (final config in _patchConfigs.values) {
      config.dispose();
    }
    _state.dispose();
    acpiConfig.dispose();
    super.dispose();
  }
}
