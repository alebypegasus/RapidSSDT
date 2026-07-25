//  imei.dart 
//  Created by JeoJay127 
//
import 'package:flutter/material.dart';
import 'package:rapidssdt/widgets/checkboxlist/smart_checkbox_list.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';

class IMEIPatchOptions extends StatefulWidget {
  const IMEIPatchOptions({super.key, this.onChanged});
  final ValueChanged<String?>? onChanged;

  @override
  State<IMEIPatchOptions> createState() => _IMEIPatchOptionsState();
}

class _IMEIPatchOptionsState extends State<IMEIPatchOptions> {
  // 原始IMEI映射（key: 描述, value: 代码）
  static const Map<String, String> _imeiMap = {
    "搭配 7 系列芯片组的 Sandy Bridge CPU": "3A1C",
    "搭配 6 系列芯片组的 Ivy Bridge CPU": "3A1E",
    "需要使用 DeviceProperties 设置device-id": "",
  };

  // 生成标题到IMEI值的映射
  late final Map<String, String> _titleToValue;
  String? _selectedIMEI;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onChanged?.call(_selectedIMEI);
    });
  }

  String _getTitle(String key, String value, AppLocalizations? l10n) {
    if (value.isEmpty) {
      return '${l10n?.imeiNotSpoofed ?? "未启用仿冒IMEI, "}$key';
    }
    return '${l10n?.imeiSpoofedValue ?? "启用仿冒IMEI: "}$value, ${l10n?.applicableTo ?? "适用于"}$key';
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    
    // Map with translated keys
    final translatedImeiMap = {
      l10n?.sandyBridge7Series ?? "搭配 7 系列芯片组的 Sandy Bridge CPU": "3A1C",
      l10n?.ivyBridge6Series ?? "搭配 6 系列芯片组的 Ivy Bridge CPU": "3A1E",
      l10n?.devicePropertiesDeviceId ?? "需要使用 DeviceProperties 设置device-id": "",
    };

    final titleToValue = {
      for (final entry in translatedImeiMap.entries)
        _getTitle(entry.key, entry.value, l10n): entry.value,
    };

    final List<String> selectedTitles = _selectedIMEI != null
        ? titleToValue.entries
              .where((entry) => entry.value == _selectedIMEI)
              .map((entry) => entry.key)
              .toList()
        : [];

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
            SmartCheckBoxList(
              title: l10n?.imeiPatch ?? 'IMEI 补丁:',
              choices: titleToValue.keys.toList(),
              selectedChoices: selectedTitles,
              isMultipleSelection: false,
              onChanged: (List<String> selectedTitles) {
                if (selectedTitles.isEmpty) {
                  _selectedIMEI = null;
                } else {
                  _selectedIMEI = titleToValue[selectedTitles.first];
                }
                widget.onChanged?.call(_selectedIMEI);
              },
            ),
          ],
        ),
      ),
    );
  }
}
