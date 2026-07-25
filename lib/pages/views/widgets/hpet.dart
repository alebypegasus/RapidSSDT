//  hpet.dart 
//  Created by JeoJay127 
//
import 'package:flutter/material.dart';
import 'package:rapidssdt/widgets/custom_textfield.dart';
import 'package:rapidssdt/widgets/checkboxlist/smart_checkbox_list.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';

typedef OptionChanged = void Function(String value);

class HPETPatchOptions extends StatefulWidget {
  final List<String> currentLegacyIRQs;
  final OptionChanged onOptionChanged;
  final OptionChanged onCustomIRQChanged;
  const HPETPatchOptions({
    super.key,
    required this.currentLegacyIRQs,
    required this.onOptionChanged,
    required this.onCustomIRQChanged,
  });

  @override
  State<HPETPatchOptions> createState() => _HPETPatchOptionsState();
}

class _HPETPatchOptionsState extends State<HPETPatchOptions> {
  final TextEditingController _customController = TextEditingController(
    text: '',
  );
  final FocusNode _focusNodeHept = FocusNode();
  late final VoidCallback _listener;
  String selectedValue = 'C';
  late Map<String, String> hpetChoices;
  static final RegExp _irqRegExp = RegExp(
    r'^\s*'
    r'(?:'
    r'[OCLocl]' // 单字符控制命令
    r'|'
    r'[A-Za-z][A-Za-z0-9]{0,3}:(?:\d+(?:,\d+)*|)' // 设备名 + IRQ（可空）
    r')'
    r'(?:\s+'
    r'(?:[OCLocl]|[A-Za-z][A-Za-z0-9]{0,3}:(?:\d+(?:,\d+)*|))'
    r')*'
    r'\s*$',
  );

  @override
  void initState() {
    super.initState();
    hpetChoices = {};
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onOptionChanged(selectedValue);
    });
    _listener = () {
      if (!_focusNodeHept.hasFocus) {
        if (_customController.text.isEmpty ||
            _irqRegExp.hasMatch(_customController.text)) {
          widget.onCustomIRQChanged(selectedValue);
        } else {
          widget.onCustomIRQChanged('');
        }
      }
    };
    _focusNodeHept.addListener(_listener);
  }

  @override
  void dispose() {
    _focusNodeHept.removeListener(_listener);
    _customController.dispose();
    _focusNodeHept.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    hpetChoices = {
      l10n?.hpetChoiceC ?? "C: 仅来自 * 设备冲突IRQ（0,2,8,11）": "C",
      l10n?.hpetChoiceL ?? "L: 仅来自 * 设备使用的IRQ": "L",
      l10n?.hpetChoiceO ?? "O: 来自所有设备冲突IRQ（0,2,8,11）": "O",
    };

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      constraints: const BoxConstraints(
        minHeight: 60,
        minWidth: double.infinity,
      ),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(6),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        l10n?.currentLegacyIrqs ?? '当前 Legacy IRQs:',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      ...widget.currentLegacyIRQs.map(
                        (irq) => Text(
                          irq,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: SmartCheckBoxList(
                    choices: hpetChoices.entries
                        .map((entry) => entry.key)
                        .toList(),
                    selectedChoices: hpetChoices.entries
                        .where(
                          (entry) => entry.value == selectedValue.toUpperCase(),
                        )
                        .map((entry) => entry.key)
                        .toList(),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        _customController.text = '';
                        selectedValue = hpetChoices[value.first] ?? '';
                      } else {
                        selectedValue = '';
                      }
                      widget.onOptionChanged(selectedValue);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              l10n?.customIrqsDesc ?? '自定义IRQs,设备之间用空格分隔，IRQ之间用逗号分隔,例如: RTC:0 IPIC:2 TMR:8,11',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 11,
                color: isDarkMode ? Colors.grey.shade500 : Colors.grey.shade400,
              ),
            ),
            Row(
              children: [
                Text(
                  l10n?.customIrqs ?? '自定义IRQs:',
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 5),
                CustomTextField(
                  controller: _customController,
                  focusNode: _focusNodeHept,
                  hintText: l10n?.customIrqsExample ?? '示例: RTC:0 IPIC:2 TMR:8,11',
                  errorText: l10n?.customIrqFormatError ?? '自定义 IRQ 列表格式错误',
                  validator: (value) {
                    return value.isEmpty || _irqRegExp.hasMatch(value);
                  },
                  onChanged: (value, _) {
                    setState(() {
                      selectedValue = value;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
