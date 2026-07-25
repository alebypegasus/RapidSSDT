//  acpi_options.dart 
//  Created by JeoJay127 
//
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:rapidssdt/utils/ssdttool/config.dart';
import 'package:rapidssdt/widgets/radio_option_group.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';
import 'package:rapidssdt/l10n/l10n_helper.dart';

class OptionItem<T> {
  final T value;
  final String label;
  const OptionItem(this.value, this.label);
}

List<OptionItem<bool>> getAcpiOptions(AppLocalizations? l10n) => [
      OptionItem(true, l10n?.builtin ?? l10nGlobal.ssdtMsg551),
      OptionItem(false, l10n?.remote ?? l10nGlobal.ssdtMsg552),
    ];

List<OptionItem<bool>> getLegacyIaslOptions(AppLocalizations? l10n) => [
      OptionItem(false, l10n?.newIasl ?? l10nGlobal.ssdtMsg553),
      OptionItem(true, l10n?.oldIasl ?? l10nGlobal.ssdtMsg554),
    ];

List<OptionItem<bool>> getYesNoOptions(AppLocalizations? l10n) => [
      OptionItem(true, l10n?.yes ?? l10nGlobal.ssdtMsg555),
      OptionItem(false, l10n?.no ?? l10nGlobal.ssdtMsg556),
    ];

/// ACPI选项组件
class AcpiOptions extends StatefulWidget {
  const AcpiOptions({super.key, required this.config, this.onChanged});

  final AcpiConfig config;
  final ValueChanged<AcpiConfig>? onChanged;

  @override
  State<AcpiOptions> createState() => _AcpiOptionsState();
}

class _AcpiOptionsState extends State<AcpiOptions> {
  late AcpiConfig config;

  @override
  void initState() {
    super.initState();
    config = widget.config;
  }

  void _update(AcpiConfig newConfig) {
    setState(() => config = newConfig);
    widget.onChanged?.call(newConfig);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final yesNoOptions = getYesNoOptions(l10n);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: MacosTheme.of(context).primaryColor.withOpacity(0.15),
            border: Border(
              bottom: BorderSide(color: MacosTheme.of(context).dividerColor ?? MacosColors.systemGrayColor, width: 0.5),
            ),
          ),
          child: Text(
            l10n?.preferences ?? l10nGlobal.ssdtMsg557,
            style: MacosTheme.of(context).typography.headline,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 5,
              children: [
                _buildOptionRow<bool>(
                  label: l10n?.iaslMode ?? l10nGlobal.ssdtMsg558,
                  groupValue: config.useLocaliAsl,
                  choices: getAcpiOptions(l10n),
                  onChanged: (val) =>
                      _update(config.copyWith(useLocaliAsl: val)),
                ),
                _buildOptionRow<bool>(
                  label: l10n?.iaslCompileType ?? l10nGlobal.ssdtMsg559,
                  groupValue: config.useLeagcyiAsl,
                  choices: getLegacyIaslOptions(l10n),
                  onChanged: (val) =>
                      _update(config.copyWith(useLeagcyiAsl: val)),
                ),
                _buildOptionRow<bool>(
                  label: l10n?.deleteDsl ?? l10nGlobal.ssdtMsg560,
                  groupValue: config.deleteDsl,
                  choices: yesNoOptions,
                  onChanged: (val) => _update(config.copyWith(deleteDsl: val)),
                ),
                _buildOptionRow<bool>(
                  label: l10n?.forceCompile ?? l10nGlobal.ssdtMsg561,
                  groupValue: config.force,
                  choices: yesNoOptions,
                  onChanged: (val) => _update(config.copyWith(force: val)),
                ),
                _buildOptionRow<bool>(
                  label: l10n?.overwriteEFI ?? l10nGlobal.ssdtMsg562,
                  groupValue: config.overwriteEFI,
                  choices: yesNoOptions,
                  onChanged: (val) =>
                      _update(config.copyWith(overwriteEFI: val)),
                ),
                _buildOptionRow<ACPIMatchMode>(
                  label: l10n?.acpiMatchMode ?? l10nGlobal.ssdtMsg563,
                  groupValue: config.acpiMatchMode,
                  choices: ACPIMatchMode.values
                      .map((m) => OptionItem(m, m.value))
                      .toList(),
                  onChanged: (val) =>
                      _update(config.copyWith(acpiMatchMode: val)),
                  direction: RadioGroupDirection.wrap,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionRow<T>({
    required String label,
    required T groupValue,
    required List<OptionItem<T>> choices,
    required ValueChanged<T> onChanged,
    RadioGroupDirection direction = RadioGroupDirection.wrap,
  }) {
    final List<Widget> children = [];
    final RadioOptionGroup radioOptionGroup = RadioOptionGroup(
      direction: direction,
      groupValue: choices.firstWhere((o) => o.value == groupValue).label,
      onChanged: (val) {
        final selected = choices.firstWhere((o) => o.label == val);
        onChanged(selected.value);
      },
      options: choices
          .map((e) => RadioOptionData(value: e.label, label: e.label))
          .toList(),
    );
    children.add(Text('$label:', style: TextStyle(fontSize: 11, color: MacosTheme.of(context).typography.body.color)));
    children.add(const SizedBox(height: 5));
    children.add(radioOptionGroup);
    Widget child;
    if (direction == RadioGroupDirection.row) {
      child = Row(children: children);
    } else {
      child = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      );
    }
    return child;
  }
}
