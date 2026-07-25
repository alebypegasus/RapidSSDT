import 'package:flutter/material.dart' hide Checkbox, CheckboxListTile;
import 'package:macos_ui/macos_ui.dart';
import 'package:rapidssdt/pages/provider/patch_viewmodel_provider.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';
import 'package:rapidssdt/l10n/l10n_helper.dart';
import 'package:rapidssdt/pages/model/patch_state.dart';
import 'package:rapidssdt/pages/viewmodel/patch_viewmodel.dart';
import 'package:rapidssdt/utils/log/log.dart';
import 'package:rapidssdt/utils/ssdttool/table.dart';
import 'package:rapidssdt/widgets/choose_file.dart';

import 'widgets/gpu_spoof.dart';
import 'widgets/hpet.dart';
import 'widgets/imei.dart';
import 'widgets/pci_bridge.dart';
import 'widgets/pci_disable.dart';
import 'widgets/pnlf.dart';
import 'widgets/table_selection.dart';
import 'widgets/usbx.dart';
import 'widgets/xosi.dart';

class BuilderView extends StatelessWidget {
  const BuilderView({super.key});

  String _getCategoryName(String key, AppLocalizations? l10n) {
    switch (key) {
      case 'corePatches': return l10n?.corePatches ?? l10nGlobal.ssdtMsg564;
      case 'functionPatches': return l10n?.functionPatches ?? l10nGlobal.ssdtMsg565;
      case 'devicePatches': return l10n?.devicePatches ?? l10nGlobal.ssdtMsg566;
      case 'specialPatches': return l10n?.specialPatches ?? l10nGlobal.ssdtMsg567;
      case 'sleepPatches': return l10n?.sleepPatches ?? l10nGlobal.ssdtMsg568;
      case 'auxiliaryPatches': return l10n?.auxiliaryPatches ?? l10nGlobal.ssdtMsg569;
      case 'prebuiltPatches': return l10n?.prebuiltPatches ?? l10nGlobal.ssdtMsg570;
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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final patchViewModel = PatchViewModelProvider.of(context);

    return MacosScaffold(
      toolBar: const ToolBar(
        title: Text('SSDT Builder'),
        titleWidth: 200.0,
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: _buildCategoryList(context, patchViewModel, l10n),
                  ),
                  const VerticalDivider(width: 20),
                  Expanded(
                    flex: 2,
                    child: _buildActionList(context, patchViewModel, l10n),
                  ),
                  const VerticalDivider(width: 20),
                  Expanded(
                    flex: 3,
                    child: _buildPatchEditor(context, patchViewModel, l10n),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildCategoryList(BuildContext context, PatchViewModel patchViewModel, AppLocalizations? l10n) {
    final isDark = MacosTheme.of(context).brightness == Brightness.dark;
    return ValueListenableBuilder<PatchState>(
      valueListenable: patchViewModel.state,
      builder: (context, state, _) {
        return ListView(
          children: patchViewModel.patchCategories.map((category) {
            final catNameKey = category.name;
            return _buildListTile(
              context: context,
              title: _getCategoryName(catNameKey, l10n),
              onTap: () => patchViewModel.resetPatchStates(catName: catNameKey),
              isSelected: state.selectedCategory == catNameKey,
              isDark: isDark,
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildActionList(BuildContext context, PatchViewModel patchViewModel, AppLocalizations? l10n) {
    final isDark = MacosTheme.of(context).brightness == Brightness.dark;
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
            final actionRemark = _getRemark(actionName, defaultRemark, l10n);
            final prebuilt = selectedCat == 'prebuiltPatches';
            return _buildListTile(
              context: context,
              title: actionName,
              subtitle: actionRemark,
              onTap: () => patchViewModel.updatePatchVisibility(action, prebuilt),
              isSelected: selectedAction.name == actionName,
              isDark: isDark,
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildListTile({
    required BuildContext context,
    required String title,
    String? subtitle,
    required VoidCallback onTap,
    required bool isSelected,
    required bool isDark,
  }) {
    final primaryColor = MacosTheme.of(context).primaryColor;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
        margin: const EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark ? const Color(0xFF464646) : const Color(0xFFE6E6E6))
              : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                  color: isSelected ? primaryColor : null,
                ),
              ),
              if (subtitle != null && subtitle.isNotEmpty) ...[
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? primaryColor?.withOpacity(0.8) : MacosColors.systemGrayColor,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPatchEditor(BuildContext context, PatchViewModel patchViewModel, AppLocalizations? l10n) {
    return ValueListenableBuilder<PatchState>(
      valueListenable: patchViewModel.state,
      builder: (context, state, _) {
        if (state.selectedAction.isEmpty) {
          return const Center(child: Text('Select an action to configure'));
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildVisiblePatches(context, patchViewModel, state.selectedAction.name, l10n),
            const SizedBox(height: 12),
            _buildPatchNote(context, patchViewModel, state.selectedAction.name, l10n),
          ],
        );
      },
    );
  }

  Widget _buildPatchNote(BuildContext context, PatchViewModel patchViewModel, String actionName, AppLocalizations? l10n) {
    return Flexible(
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 10,
          minWidth: double.infinity,
        ),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: MacosTheme.of(context).dividerColor ?? MacosColors.systemGrayColor),
          borderRadius: BorderRadius.circular(6),
        ),
        child: SingleChildScrollView(
          child: SelectableText.rich(
            TextSpan(
              text: _getNote(
                actionName, 
                patchViewModel.getActionNote(), 
                l10n
              )
            ),
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ),
    );
  }

  Widget _buildVisiblePatches(BuildContext context, PatchViewModel patchViewModel, String action, AppLocalizations? l10n) {
    final config = patchViewModel.patchConfigs[action];
    if (config == null) return const SizedBox.shrink();

    return ValueListenableBuilder<bool>(
      valueListenable: config.isVisible,
      builder: (context, isVisible, _) {
        if (!isVisible) return const SizedBox.shrink();
        return _buildPatchOption(context, patchViewModel, action, l10n);
      },
    );
  }

  Widget _buildPatchOption(BuildContext context, PatchViewModel patchViewModel, String action, AppLocalizations? l10n) {
    final config = patchViewModel.patchConfigs[action];
    if (config == null) return const SizedBox.shrink();

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
          buttonText: l10n?.selectDmar ?? l10nGlobal.ssdtMsg577,
          hintText: l10n?.hintDmar ?? l10nGlobal.ssdtMsg578,
          initialPath: data,
          onChanged: (value) => patchViewModel.updatePatchConfigPath(
            action, value, onError: (error) => Log.warning(error),
          ),
        ),
      ),
      ACPITable.ssdtAPIC.name: () => buildWithConfig(
        (data) => TableSelectionWidget(
          buttonText: l10n?.selectApic ?? l10nGlobal.ssdtMsg579,
          hintText: l10n?.hintApic ?? l10nGlobal.ssdtMsg580,
          initialPath: data,
          onChanged: (value) => patchViewModel.updatePatchConfigPath(
            action, value, onError: (error) => Log.warning(error),
          ),
        ),
      ),
      ACPITable.ssdtIMEI.name: () => bindConfig(
        (data, onChanged) => IMEIPatchOptions(onChanged: onChanged),
      ),
      ACPITable.checkAOAC.name: () => buildWithConfig(
        (data) => TableSelectionWidget(
          buttonText: l10n?.selectFacp ?? l10nGlobal.ssdtMsg581,
          hintText: l10n?.hintFacp ?? l10nGlobal.ssdtMsg582,
          initialPath: data,
          onChanged: (value) => patchViewModel.updatePatchConfigPath(
            action, value, onError: (error) => Log.warning(error),
          ),
        ),
      ),
      ACPITable.ssdtFACP.name: () => buildWithConfig(
        (data) => TableSelectionWidget(
          buttonText: l10n?.selectFacp ?? l10nGlobal.ssdtMsg583,
          hintText: l10n?.hintFacp ?? l10nGlobal.ssdtMsg584,
          initialPath: data,
          onChanged: (value) => patchViewModel.updatePatchConfigPath(
            action, value, onError: (error) => Log.warning(error),
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
}
