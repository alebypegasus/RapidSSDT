//  custom_dropdown_button.dart 
//  Created by JeoJay127 
//
import 'package:flutter/material.dart' hide DropdownButton, DropdownMenuItem;
import 'package:macos_ui/macos_ui.dart';

class DropdownOption {
  final String value;
  final String label;
  const DropdownOption({required this.value, required this.label});
}

class CustomDropdownButton extends StatelessWidget {
  final String? value;
  final List<DropdownOption> options;
  final String placeholder;
  final ValueChanged<String?>? onChanged;
  final double fontSize;
  final bool showPlaceholder;

  const CustomDropdownButton({
    super.key,
    required this.value,
    required this.options,
    this.placeholder = '请选择',
    this.onChanged,
    this.fontSize = 11,
    this.showPlaceholder = true,
  });

  @override
  Widget build(BuildContext context) {
    final uniqueOptions = _getUniqueOptions(options);
    final FocusNode focusNode = FocusNode();
    final items = <MacosPopupMenuItem<String>>[];
    if (showPlaceholder) {
      items.add(
        MacosPopupMenuItem(
          value: placeholder,
          child: Text(placeholder, style: TextStyle(fontSize: fontSize)),
        ),
      );
    }
    items.addAll(
      uniqueOptions.map(
        (opt) => MacosPopupMenuItem(
          value: opt.value,
          child: Text(opt.label, style: TextStyle(fontSize: fontSize)),
        ),
      ),
    );

    final validValue = _getValidValue(value, items);

    return MacosPopupButton<String>(
      value: validValue,
      items: items,
      hint: showPlaceholder
          ? Text(placeholder, style: TextStyle(fontSize: fontSize))
          : null,
      onChanged: (val) {
        focusNode.unfocus();
        if (val == placeholder) {
          onChanged?.call(null);
        } else {
          onChanged?.call(val);
        }
      },
    );
  }

  // 去重
  List<DropdownOption> _getUniqueOptions(List<DropdownOption> options) {
    final Map<String, DropdownOption> uniqueMap = {};
    for (final opt in options) {
      uniqueMap[opt.value] = opt;
    }
    return uniqueMap.values.toList();
  }

  // 处理占位符显示
  String? _getValidValue(String? value, List<MacosPopupMenuItem<String>> items) {

    if (!showPlaceholder) {
      if (value == null) return null;
      final hasMatch = items.any((item) => item.value == value);
      return hasMatch ? value : null;
    }

    if (value == null || value.isEmpty) {
      return null;
    }
    final hasMatch = items.any((item) => item.value == value);
    return hasMatch ? value : null;
  }
}
