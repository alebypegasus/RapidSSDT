//  acpi_page.dart
//  Created by JeoJay127
//
import 'package:flutter/material.dart';
import 'package:rapidssdt/pages/model/patch_state.dart';
import 'package:rapidssdt/pages/provider/patch_viewmodel_provider.dart';
import 'package:rapidssdt/pages/views/about_page.dart';
import 'package:rapidssdt/pages/views/acpi_options.dart';
import 'package:rapidssdt/pages/views/markdown_page.dart';
import 'package:rapidssdt/pages/views/ssdt_platform.dart';
import 'package:rapidssdt/pages/views/update_check.dart';
import 'package:rapidssdt/pages/views/widgets/gpu_spoof.dart';
import 'package:rapidssdt/pages/views/widgets/hpet.dart';
import 'package:rapidssdt/pages/views/widgets/imei.dart';
import 'package:rapidssdt/pages/views/widgets/pci_bridge.dart';
import 'package:rapidssdt/pages/views/widgets/pci_disable.dart';
import 'package:rapidssdt/pages/views/widgets/pnlf.dart';
import 'package:rapidssdt/pages/views/widgets/table_selection.dart';
import 'package:rapidssdt/pages/views/widgets/usbx.dart';
import 'package:rapidssdt/pages/views/widgets/xosi.dart';
import 'package:rapidssdt/utils/log/log.dart';
import 'package:rapidssdt/utils/log/logwidet.dart';
import 'package:rapidssdt/utils/ssdttool/config.dart';
import 'package:rapidssdt/utils/ssdttool/table.dart';
import 'package:rapidssdt/widgets/choose_file.dart';
import 'package:rapidssdt/widgets/inkwell_widget.dart';
import 'package:rapidssdt/pages/viewmodel/patch_viewmodel.dart';

import 'package:rapidssdt/l10n/language_provider.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';

class AcpiPage extends StatefulWidget {
  final LanguageProvider? languageProvider;
  const AcpiPage({super.key, this.languageProvider});
  @override
  State<AcpiPage> createState() => _AcpiPageState();
}

class _AcpiPageState extends State<AcpiPage> {
  String _getCategoryName(String key, AppLocalizations? l10n) {
    switch (key) {
      case 'corePatches': return l10n?.corePatches ?? '核心补丁';
      case 'functionPatches': return l10n?.functionPatches ?? '功能补丁';
      case 'devicePatches': return l10n?.devicePatches ?? '设备补丁';
      case 'specialPatches': return l10n?.specialPatches ?? '专用补丁';
      case 'sleepPatches': return l10n?.sleepPatches ?? '睡眠补丁';
      case 'auxiliaryPatches': return l10n?.auxiliaryPatches ?? '辅助补丁';
      case 'prebuiltPatches': return l10n?.prebuiltPatches ?? '预制补丁';
      default: return key;
    }
  }

  String _getCategoryRemark(String key, AppLocalizations? l10n) {
    switch (key) {
      case 'corePatches': return l10n?.corePatchesRemark ?? '系统正常启动和电源管理必需的基础补丁';
      case 'functionPatches': return l10n?.functionPatchesRemark ?? '提供额外功能或修复特性问题的补丁';
      case 'devicePatches': return l10n?.devicePatchesRemark ?? '针对显卡硬件的补丁';
      case 'specialPatches': return l10n?.specialPatchesRemark ?? '仅在特定主板或架构需要的补丁';
      case 'sleepPatches': return l10n?.sleepPatchesRemark ?? '非必需，用于修复睡眠问题';
      case 'auxiliaryPatches': return l10n?.auxiliaryPatchesRemark ?? '非必需，但可以补全ACPI结构或增强兼容性';
      default: return key;
    }
  }

  String _getRemark(String name, String defaultRemark, AppLocalizations? l10n) {
    if (l10n == null) return defaultRemark;
    switch(name) {
      case 'SSDT-HPET': return l10n.remark_ssdtHPET ?? defaultRemark;
      case 'SSDT-EC-USBX-DESKTOP': return l10n.remark_ssdtECUSBXDesktop ?? defaultRemark;
      case 'SSDT-EC-USBX-LAPTOP': return l10n.remark_ssdtECUSBXLaptop ?? defaultRemark;
      case 'SSDT-EC-DESKTOP': return l10n.remark_ssdtECDesktop ?? defaultRemark;
      case 'SSDT-EC-LAPTOP': return l10n.remark_ssdtECLaptop ?? defaultRemark;
      case 'SSDT-USBX': return l10n.remark_ssdtUSBX ?? defaultRemark;
      case 'SSDT-PLUG': return l10n.remark_ssdtPLUG ?? defaultRemark;
      case 'SSDT-PMC': return l10n.remark_ssdtPMC ?? defaultRemark;
      case 'SSDT-PNLF': return l10n.remark_ssdtPNLF ?? defaultRemark;
      case 'SSDT-ALS0': return l10n.remark_ssdtALS0 ?? defaultRemark;
      case 'SSDT-XOSI': return l10n.remark_ssdtXOSI ?? defaultRemark;
      case 'SSDT-RHUB': return l10n.remark_ssdtRHUB ?? defaultRemark;
      case 'SSDT-Bridge': return l10n.remark_ssdtBridge ?? defaultRemark;
      case 'SSDT-DMAR': return l10n.remark_ssdtDMAR ?? defaultRemark;
      case 'SSDT-APIC': return l10n.remark_ssdtAPIC ?? defaultRemark;
      case 'SSDT-SBUS-MCHC': return l10n.remark_ssdtSBUSMCHC ?? defaultRemark;
      case 'SSDT-IMEI': return l10n.remark_ssdtIMEI ?? defaultRemark;
      case 'SSDT-FixShutdown': return l10n.remark_ssdtFixShutdown ?? defaultRemark;
      case 'Check-System-State': return l10n.remark_checkSystemState ?? defaultRemark;
      case 'Check-AOAC': return l10n.remark_checkAOAC ?? defaultRemark;
      case 'SSDT-GPRW': return l10n.remark_ssdtGPRW ?? defaultRemark;
      case 'SSDT-UPRW': return l10n.remark_ssdtUPRW ?? defaultRemark;
      case 'SSDT-LID': return l10n.remark_ssdtLID ?? defaultRemark;
      case 'SSDT-WakeScreen': return l10n.remark_ssdtWakeScreen ?? defaultRemark;
      case 'SSDT-LED': return l10n.remark_ssdtLED ?? defaultRemark;
      case 'SSDT-S3-DISABLE': return l10n.remark_ssdtS3Disable ?? defaultRemark;
      case 'SSDT-FACP': return l10n.remark_ssdtFACP ?? defaultRemark;
      case 'SSDT-GPU-SPOOF': return l10n.remark_ssdtGPUSPOOF ?? defaultRemark;
      case 'SSDT-PCI-DISABLE': return l10n.remark_ssdtPCIDISABLE ?? defaultRemark;
      case 'SSDT-RMNE': return l10n.remark_ssdtRMNE ?? defaultRemark;
      case 'SSDT-GPI0': return l10n.remark_ssdtGPI0 ?? defaultRemark;
      case 'SSDT-CPUR': return l10n.remark_ssdtCPUR ?? defaultRemark;
      case 'SSDT-PLUG-ALT': return l10n.remark_ssdtPLUGALT ?? defaultRemark;
      case 'SSDT-AWAC': return l10n.remark_ssdtAWAC ?? defaultRemark;
      case 'SSDT-UNC': return l10n.remark_ssdtUNC ?? defaultRemark;
      case 'SSDT-RTC0-RANGE': return l10n.remark_ssdtRTC0RANGE ?? defaultRemark;
      case 'SSDT-DTGP': return l10n.remark_ssdtDTGP ?? defaultRemark;
      case 'SSDT-DMAC': return l10n.remark_ssdtDMAC ?? defaultRemark;
      case 'SSDT-PWRB': return l10n.remark_ssdtPWRB ?? defaultRemark;
      case 'SSDT-SLPB': return l10n.remark_ssdtSLPB ?? defaultRemark;
      case 'SSDT-MEM2': return l10n.remark_ssdtMEM2 ?? defaultRemark;
      default: return defaultRemark;
    }
  }

  String _getNote(String name, String defaultNote, AppLocalizations? l10n) {
    if (l10n == null) return defaultNote;
    switch(name) {
      case 'SSDT-HPET': return l10n.note_ssdtHPET ?? defaultNote;
      case 'SSDT-EC-USBX-DESKTOP': return l10n.note_ssdtECUSBXDesktop ?? defaultNote;
      case 'SSDT-EC-USBX-LAPTOP': return l10n.note_ssdtECUSBXLaptop ?? defaultNote;
      case 'SSDT-EC-DESKTOP': return l10n.note_ssdtECDesktop ?? defaultNote;
      case 'SSDT-EC-LAPTOP': return l10n.note_ssdtECLaptop ?? defaultNote;
      case 'SSDT-USBX': return l10n.note_ssdtUSBX ?? defaultNote;
      case 'SSDT-PLUG': return l10n.note_ssdtPLUG ?? defaultNote;
      case 'SSDT-PMC': return l10n.note_ssdtPMC ?? defaultNote;
      case 'SSDT-PNLF': return l10n.note_ssdtPNLF ?? defaultNote;
      case 'SSDT-ALS0': return l10n.note_ssdtALS0 ?? defaultNote;
      case 'SSDT-XOSI': return l10n.note_ssdtXOSI ?? defaultNote;
      case 'SSDT-RHUB': return l10n.note_ssdtRHUB ?? defaultNote;
      case 'SSDT-Bridge': return l10n.note_ssdtBridge ?? defaultNote;
      case 'SSDT-DMAR': return l10n.note_ssdtDMAR ?? defaultNote;
      case 'SSDT-APIC': return l10n.note_ssdtAPIC ?? defaultNote;
      case 'SSDT-SBUS-MCHC': return l10n.note_ssdtSBUSMCHC ?? defaultNote;
      case 'SSDT-IMEI': return l10n.note_ssdtIMEI ?? defaultNote;
      case 'SSDT-FixShutdown': return l10n.note_ssdtFixShutdown ?? defaultNote;
      case 'Check-System-State': return l10n.note_checkSystemState ?? defaultNote;
      case 'Check-AOAC': return l10n.note_checkAOAC ?? defaultNote;
      case 'SSDT-GPRW': return l10n.note_ssdtGPRW ?? defaultNote;
      case 'SSDT-UPRW': return l10n.note_ssdtUPRW ?? defaultNote;
      case 'SSDT-LID': return l10n.note_ssdtLID ?? defaultNote;
      case 'SSDT-WakeScreen': return l10n.note_ssdtWakeScreen ?? defaultNote;
      case 'SSDT-LED': return l10n.note_ssdtLED ?? defaultNote;
      case 'SSDT-S3-DISABLE': return l10n.note_ssdtS3Disable ?? defaultNote;
      case 'SSDT-FACP': return l10n.note_ssdtFACP ?? defaultNote;
      case 'SSDT-GPU-SPOOF': return l10n.note_ssdtGPUSPOOF ?? defaultNote;
      case 'SSDT-PCI-DISABLE': return l10n.note_ssdtPCIDISABLE ?? defaultNote;
      case 'SSDT-RMNE': return l10n.note_ssdtRMNE ?? defaultNote;
      case 'SSDT-GPI0': return l10n.note_ssdtGPI0 ?? defaultNote;
      case 'SSDT-CPUR': return l10n.note_ssdtCPUR ?? defaultNote;
      case 'SSDT-PLUG-ALT': return l10n.note_ssdtPLUGALT ?? defaultNote;
      case 'SSDT-AWAC': return l10n.note_ssdtAWAC ?? defaultNote;
      case 'SSDT-UNC': return l10n.note_ssdtUNC ?? defaultNote;
      case 'SSDT-RTC0-RANGE': return l10n.note_ssdtRTC0RANGE ?? defaultNote;
      case 'SSDT-DTGP': return l10n.note_ssdtDTGP ?? defaultNote;
      case 'SSDT-DMAC': return l10n.note_ssdtDMAC ?? defaultNote;
      case 'SSDT-PWRB': return l10n.note_ssdtPWRB ?? defaultNote;
      case 'SSDT-SLPB': return l10n.note_ssdtSLPB ?? defaultNote;
      case 'SSDT-MEM2': return l10n.note_ssdtMEM2 ?? defaultNote;
      default: return defaultNote;
    }
  }

  late PatchViewModel patchViewModel = PatchViewModelProvider.of(context);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      UpdateDialog.checkLatestRelease(context);
    });
  }

  /// 构建ACPI选项
  /// [action] ACPI选项名称
  Widget _buildPatchOption(String action) {
    final config = patchViewModel.patchConfigs[action];
    if (config == null) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context);

    Widget buildWithConfig(Widget Function(dynamic data) builder) {
      return ValueListenableBuilder<dynamic>(
        valueListenable: config.data,
        builder: (context, data, _) => builder(data),
      );
    }

    Widget bindConfig(
      Widget Function(dynamic data, ValueChanged<dynamic> onChanged) builder,
    ) {
      return buildWithConfig(
        (data) => builder(data, (v) => config.data.value = v),
      );
    }

    final widgetBuilders = <String, Widget Function()>{
      ACPITable.ssdtHPET.name: () => ValueListenableBuilder<PatchState>(
        valueListenable: patchViewModel.state,
        builder: (context, state, _) => HPETPatchOptions(
          currentLegacyIRQs: state.legacyIrqs,
          onOptionChanged: patchViewModel.handleLegacyIrqsChange,
          onCustomIRQChanged: patchViewModel.handleLegacyIrqsChange,
        ),
      ),

      ACPITable.ssdtUSBX.name: () => bindConfig(
        (data, onChanged) => USBXPatchOptions(onChanged: onChanged),
      ),

      ACPITable.ssdtPNLF.name: () => bindConfig(
        (data, onChanged) => PNLFPatchOptions(onChanged: onChanged),
      ),

      ACPITable.ssdtXOSI.name: () => bindConfig(
        (data, onChanged) => XOSIPatchOptions(onChanged: onChanged),
      ),

      ACPITable.ssdtBridge.name: () => bindConfig(
        (data, onChanged) => PCIBridgePatchOptions(onChanged: onChanged),
      ),

      ACPITable.ssdtDMAR.name: () => buildWithConfig(
        (data) => TableSelectionWidget(
          buttonText: l10n?.selectDmar ?? '选择DMAR',
          hintText: l10n?.hintDmar ?? '请选择需要定制的DMAR表',
          initialPath: data,
          onChanged: (value) => patchViewModel.updatePatchConfigPath(
            action,
            value,
            onError: (error) => Log.warning(error),
          ),
        ),
      ),

      ACPITable.ssdtAPIC.name: () => buildWithConfig(
        (data) => TableSelectionWidget(
          buttonText: l10n?.selectApic ?? '选择APIC',
          hintText: l10n?.hintApic ?? '请选择需要定制的APIC表',
          initialPath: data,
          onChanged: (value) => patchViewModel.updatePatchConfigPath(
            action,
            value,
            onError: (error) => Log.warning(error),
          ),
        ),
      ),

      ACPITable.ssdtIMEI.name: () => bindConfig(
        (data, onChanged) => IMEIPatchOptions(onChanged: onChanged),
      ),
      ACPITable.checkAOAC.name: () => buildWithConfig(
        (data) => TableSelectionWidget(
          buttonText: l10n?.selectFacp ?? '选择FACP',
          hintText: l10n?.hintFacp ?? '请选择FACP表',
          initialPath: data,
          onChanged: (value) => patchViewModel.updatePatchConfigPath(
            action,
            value,
            onError: (error) => Log.warning(error),
          ),
        ),
      ),
      ACPITable.ssdtFACP.name: () => buildWithConfig(
        (data) => TableSelectionWidget(
          buttonText: l10n?.selectFacp ?? '选择FACP',
          hintText: l10n?.hintFacp ?? '请选择FACP表',
          initialPath: data,
          onChanged: (value) => patchViewModel.updatePatchConfigPath(
            action,
            value,
            onError: (error) => Log.warning(error),
          ),
        ),
      ),

      ACPITable.ssdtPCIDISABLE.name: () =>
          bindConfig((data, onChanged) => PciDisable(onChanged: onChanged)),

      ACPITable.ssdtGPUSPOOF.name: () =>
          bindConfig((data, onChanged) => GpuSpoof(onChanged: onChanged)),
    };

    return widgetBuilders[action]?.call() ?? const SizedBox.shrink();
  }

  // 可见补丁UI
  Widget _buildVisiblePatches() {
    return ValueListenableBuilder<PatchState>(
      valueListenable: patchViewModel.state,
      builder: (context, state, _) {
        final selectedAction = state.selectedAction;
        if (selectedAction.isEmpty) return const SizedBox.shrink();

        final config = patchViewModel.patchConfigs[selectedAction.name];
        if (config == null) return const SizedBox.shrink();

        return ValueListenableBuilder<bool>(
          valueListenable: config.isVisible,
          builder: (context, isVisible, _) {
            if (!isVisible) return const SizedBox.shrink();
            return Flexible(child: _buildPatchOption(selectedAction.name));
          },
        );
      },
    );
  }

  // 日志面板
  Widget _buildLogPanel() {
    final l10n = AppLocalizations.of(context);
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 600),
      child: Column(
        spacing: 10,
        children: [
          Text(l10n?.log ?? '日志', style: const TextStyle(fontSize: 11)),
          Flexible(
            flex: 2,
            child: LogWidget(showChannelTag: false, allChannel: true),
          ),
          ValueListenableBuilder<PatchState>(
            valueListenable: patchViewModel.state,
            builder: (context, state, _) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 15,
                children: [
                  InkWellWidget.common(
                    onTap: Log.clearAll,
                    child: Text(
                      l10n?.clearLog ?? '清除日志',
                      style: const TextStyle(fontSize: 11, color: Colors.white),
                    ),
                  ),
                  InkWellWidget.common(
                    onTap: () async {
                      Log.exportToDirectory(
                        targetDirectory: patchViewModel.desktopDirectory,
                        onSuccess: (log) => Log(log),
                        onError: (error) => Log.error(error),
                      );
                    },
                    child: Text(
                      l10n?.exportLog ?? '导出日志',
                      style: const TextStyle(fontSize: 11, color: Colors.white),
                    ),
                  ),
                  InkWellWidget.common(
                    onTap: () => patchViewModel.runPatch(
                      state.selectedAction,
                      prebuilt: state.selectedCategory == '预制补丁',
                      onError: (error) => Log.warning(error),
                    ),
                    child: Text(
                      l10n?.executePatch ?? '执行补丁',
                      style: const TextStyle(fontSize: 11, color: Colors.white),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // 自定义列表项
  Widget _buildListTile({
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    required bool isSelected,
    required bool isDark,
  }) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    return Material(
      color: isSelected
          ? (isDark ? const Color(0xFF464646) : const Color(0xFFE6E6E6))
          : (isDark ? const Color(0xFF323232) : Colors.white),
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        splashColor: isDark ? Colors.white12 : Colors.black12,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          child: ListTile(
            dense: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: isSelected ? primaryColor : null,
                fontSize: 12,
              ),
            ),
            subtitle: subtitle != null
                ? Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 11,
                      color: isSelected ? primaryColor.withAlpha(200) : null,
                    ),
                    maxLines: 3,
                  )
                : null,
            selected: isSelected,
            selectedTileColor: isDark
                ? const Color(0xFF464646)
                : const Color(0xFFE6E6E6),
          ),
        ),
      ),
    );
  }

  // 文件选择器
  Widget _buildFilePicker({
    required String buttonText,
    required OpenMode mode,
    required String? Function() getPath,
    required void Function(String?) setPath,
    String hint = '请选择文件/目录',
    List<String>? extensions,
    Function(String)? onChanged,
  }) {
    return ValueListenableBuilder<PatchState>(
      valueListenable: patchViewModel.state,
      builder: (context, state, _) {
        final path = getPath();
        return ChooseFileWidget(
          onChanged: (newPath) {
            setPath(newPath);
            onChanged?.call(newPath);
          },
          initialPath: path,
          hintText: path ?? hint,
          buttons: [
            ChooseFileButton(
              text: buttonText,
              mode: mode,
              allowedExtensions: extensions,
            ),
          ],
        );
      },
    );
  }

  // 类别列表
  Widget _buildCategoryList(bool isDark) {
    return ValueListenableBuilder<PatchState>(
      valueListenable: patchViewModel.state,
      builder: (context, state, _) {
        return ListView(
          children: patchViewModel.patchCategories.map((category) {
            final catNameKey = category.name;
            return _buildListTile(
              title: _getCategoryName(catNameKey, AppLocalizations.of(context)),
              onTap: () => patchViewModel.resetPatchStates(catName: catNameKey),
              isSelected: state.selectedCategory == catNameKey,
              isDark: isDark,
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildActionList(bool isDark) {
    return ValueListenableBuilder<PatchState>(
      valueListenable: patchViewModel.state,
      builder: (context, state, _) {
        final selectedCat = state.selectedCategory;
        final selectedAction = state.selectedAction;

        final category = patchViewModel.patchCategories.firstWhere(
          (c) => c.name == selectedCat,
          orElse: () => <String, Object>{'actions': []},
        );

        final actions = category['actions'] as List;

        return ListView(
          children: actions.map((action) {
            final actionName = action['name'] as String;
            final defaultRemark = action['remark'] as String? ?? '';
            final actionRemark = _getRemark(actionName, defaultRemark, AppLocalizations.of(context));
            final prebuilt = selectedCat == 'prebuiltPatches';
            return _buildListTile(
              title: actionName,
              subtitle: actionRemark,
              onTap: () =>
                  patchViewModel.updatePatchVisibility(action, prebuilt),
              isSelected: selectedAction.name == actionName,
              isDark: isDark,
            );
          }).toList(),
        );
      },
    );
  }

  // 补丁说明
  Widget _buildPatchNote() {
    return ValueListenableBuilder<PatchState>(
      valueListenable: patchViewModel.state,
      builder: (context, state, _) {
        if (state.selectedAction.isEmpty) return const SizedBox.shrink();
        return Flexible(
          child: Container(
            constraints: const BoxConstraints(
              minHeight: 10,
              maxHeight: 200,
              minWidth: double.infinity,
            ),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(6),
            ),
            child: SingleChildScrollView(
              child: SelectableText.rich(
                TextSpan(
                  text: _getNote(
                    state.selectedAction.name, 
                    patchViewModel.getActionNote(), 
                    AppLocalizations.of(context)
                  )
                ),
                style: const TextStyle(fontSize: 11),
              ),
            ),
          ),
        );
      },
    );
  }

  // ACPI提取+输出目录
  Widget _buildAcpiExtractRow() {
    final l10n = AppLocalizations.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        // 提取ACPI按钮
        InkWellWidget.common(
          child: Text(
            l10n?.dumpAcpi ?? '提取ACPI',
            style: const TextStyle(color: Colors.white, fontSize: 11),
          ),
          onTap: () async {
            await patchViewModel.dumpTablesAndLoadPatches(
              onError: (msg) => Log.error(msg),
              onRequestSudoPassword: () async {
                // 弹窗输入密码
                return await showDialog<String>(
                  context: context,
                  builder: (context) {
                    String password = '';
                    return AlertDialog(
                      title: const Text('Admin Privileges Required'),
                      content: TextField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Enter system password',
                        ),
                        onChanged: (v) => password = v,
                        onSubmitted: (value) => Navigator.pop(context, value),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context, null),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(context, password),
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
            );
          },
        ),
        // 输出目录选择
        Flexible(
          child: ValueListenableBuilder<PatchState>(
            valueListenable: patchViewModel.state,
            builder: (context, state, _) {
              return ChooseFileWidget(
                onChanged: (newDir) => patchViewModel.acpiConfig.value.copyWith(
                  outputDirectory: newDir,
                ),
                initialPath: state.outputDir,
                hintText: state.outputDir,
                buttons: [
                  ChooseFileButton(text: l10n?.selectOutputPath ?? '输出目录', mode: OpenMode.directory),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  // DSDT/ACPI选择器
  Widget _buildDsdtAcpiPicker() {
    final l10n = AppLocalizations.of(context);
    return ValueListenableBuilder<PatchState>(
      valueListenable: patchViewModel.state,
      builder: (context, state, _) {
        return ChooseFileWidget(
          onChanged: (selectedPath) => patchViewModel.loadTables(
            selectedPath: selectedPath,
            onError: (msg) => Log.error(msg),
          ),
          initialPath: state.tablePath,
          hintText: l10n?.selectAcpisFolder ?? '请选择DSDT文件或ACPIs目录',
          buttons: [
            ChooseFileButton(
              text: 'DSDT',
              mode: OpenMode.file,
              allowedExtensions: ['aml', 'dat'],
            ),
            ChooseFileButton(text: l10n?.selectAcpisFolder ?? '选择ACPIs', mode: OpenMode.directory),
          ],
        );
      },
    );
  }

  Widget _buildConfigSection() {
    final l10n = AppLocalizations.of(context);
    return Row(
      spacing: 10,
      children: [
        InkWellWidget.common(
          child: Text(
            l10n?.mergeConfig ?? '合并config',
            style: const TextStyle(fontSize: 11, color: Colors.white),
          ),
          onTap: () async =>
              await patchViewModel.mergePlist(onError: (msg) => Log.error(msg)),
        ),
        Flexible(
          child: _buildFilePicker(
            buttonText: l10n?.selectConfig ?? '选择config',
            mode: OpenMode.file,
            getPath: () => patchViewModel.state.value.configPath,
            setPath: (newPath) => patchViewModel.updateConfigPath(newPath),
            hint: l10n?.hintConfig ?? '请选择config.plist文件',
            extensions: ['plist'],
            onChanged: (newPath) {
              patchViewModel.getPlistType(
                newPath,
                onSuccess: (msg) => Log(msg),
                onError: (msg) => Log.error(msg),
              );
            },
          ),
        ),
      ],
    );
  }

  // 文件选择区域
  Widget _buildFileSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildAcpiExtractRow(),
        _buildDsdtAcpiPicker(),
        _buildConfigSection(),
      ],
    );
  }

  // 类别 + 操作列表区域
  Widget _buildCategoryActionList(bool isDark) {
    return Flexible(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(flex: 1, child: _buildCategoryList(isDark)),
          const VerticalDivider(width: 1),
          Flexible(flex: 2, child: _buildActionList(isDark)),
        ],
      ),
    );
  }

  // 偏好设置
  Widget _buildHeaderOptions() {
    return ValueListenableBuilder<AcpiConfig>(
      valueListenable: patchViewModel.acpiConfig,
      builder: (_, config, _) {
        return AcpiOptions(
          config: config,
          onChanged: (newConfig) => patchViewModel.updateConfig(
            newConfig,
            onLog: (msg) => Log(msg),
            onError: (msg) => Log.warning(msg),
          ),
        );
      },
    );
  }

  void showOptionsDialog({
    Widget? child,
    double? heightScale,
    double? widthScale,
  }) {
    showDialog(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black26,
      builder: (context) => Dialog(
        elevation: 0,
        alignment: Alignment.topLeft,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        clipBehavior: Clip.hardEdge,
        insetPadding: const EdgeInsets.only(left: 15, top: 50, bottom: 15),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * (widthScale ?? 0.45),
          height: MediaQuery.of(context).size.height * (heightScale ?? 1),
          child: child ?? Container(),
        ),
      ),
    );
  }

  // 选项面板
  Widget _buildOptionPanel() {
    final l10n = AppLocalizations.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 15,
      children: [
        InkWellWidget.common(
          backgroundColor: Colors.brown,
          onTap: () => showOptionsDialog(child: _buildHeaderOptions()),
          child: Text(
            l10n?.customAcpiOptions ?? '偏好设置',
            style: const TextStyle(fontSize: 11, color: Colors.white),
          ),
        ),
        InkWellWidget.common(
          backgroundColor: Colors.pink,
          onTap: () => showOptionsDialog(child: const SsdtPlatformWidget()),
          child: Text(
            l10n?.platformPreset ?? '平台补丁',
            style: const TextStyle(fontSize: 11, color: Colors.white),
          ),
        ),
        InkWellWidget.common(
          backgroundColor: Colors.deepPurple,
          onTap: () => showOptionsDialog(
            child: const MarkdownPage(mdPath: 'assets/guide/guide.md'),
          ),
          child: Text(
            l10n?.guide ?? '补丁指南',
            style: const TextStyle(fontSize: 11, color: Colors.white),
          ),
        ),
        InkWellWidget.common(
          backgroundColor: Colors.indigo,
          onTap: () => showOptionsDialog(
            heightScale: 0.72,
            child: AboutPage(languageProvider: widget.languageProvider),
          ),
          child: Text(
            l10n?.about ?? '关于应用',
            style: const TextStyle(fontSize: 11, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildLeftColumn(bool isDark) {
    return Flexible(
      flex: 1,
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildOptionPanel(),
          _buildFileSection(),
          _buildCategoryActionList(isDark),
        ],
      ),
    );
  }

  // 选中操作提示
  Widget _buildSelectedActionTip() {
    final l10n = AppLocalizations.of(context);
    return ValueListenableBuilder<PatchState>(
      valueListenable: patchViewModel.state,
      builder: (context, state, _) {
        if (state.selectedAction.isEmpty) return const SizedBox.shrink();
        return Text(
          '${l10n?.selectPatch ?? "选择补丁"}: ${state.selectedAction.name}',
          style: const TextStyle(fontSize: 11),
        );
      },
    );
  }

  Widget _buildRightColumn(bool isDark) {
    return Flexible(
      flex: 1,
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildSelectedActionTip(),
          _buildPatchNote(),
          _buildVisiblePatches(),
          Flexible(flex: 2, child: _buildLogPanel()),
        ],
      ),
    );
  }

  // 主内容区域
  Widget _buildMainContent(bool isDark) {
    return Row(
      spacing: 15,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLeftColumn(isDark),
        const VerticalDivider(width: 1),
        _buildRightColumn(isDark),
      ],
    );
  }

  // 资源释放
  @override
  void dispose() {
    patchViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: _buildMainContent(isDark),
      ),
    );
  }
}
