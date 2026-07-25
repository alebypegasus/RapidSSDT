//  pnlf.dart 
//  Created by JeoJay127 
//
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rapidssdt/pages/views/widgets/path_textfield.dart';
import 'package:rapidssdt/utils/ssdttool/config.dart';
import 'package:rapidssdt/widgets/custom_dropdown_button.dart';
import 'package:rapidssdt/widgets/custom_textfield.dart';
import 'package:rapidssdt/widgets/tip_switch.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';

class PNLFPatchOptions extends StatefulWidget {
  const PNLFPatchOptions({super.key, this.onChanged});
  final ValueChanged<(int?, String, bool)>? onChanged;
  @override
  State<PNLFPatchOptions> createState() => _PNLFPatchOptionsState();
}

class _PNLFPatchOptionsState extends State<PNLFPatchOptions> {
  late final TextEditingController _controllerUID = TextEditingController(
    text: '',
  );
  final FocusNode _focusNodeUID = FocusNode();
  final FocusNode dropdownFocusNode = FocusNode();
  int? selectedUID; // 初始 UID 值
  String manualIGPUPath = '';
  bool getIGPU = false; // 是否补充IGPU寄存器信息
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onChanged?.call((selectedUID, manualIGPUPath, getIGPU));
    });
  }

  @override
  void dispose() {
    _controllerUID.dispose();
    _focusNodeUID.dispose();
    dropdownFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final String placeholder = l10n?.selectPnlfUid ?? '为PNLF选择UID';
    return Container(
      constraints: BoxConstraints(minHeight: 60, minWidth: double.infinity),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(6),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 5,
              children: [
                Text(
                  l10n?.deviceAcpiPath ?? '设备ACPI路径:',
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                ),
                Flexible(
                  child: PathTextField(
                    pathType: PathType.acpi,
                    initialPath: '',
                    hintText: l10n?.suggestIgpuPath ?? '当选择UID=14时,建议补充IGPU ACPI路径',
                    onChanged: (value, _) {
                      manualIGPUPath = value;
                      widget.onChanged?.call((selectedUID, value, getIGPU));
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 15,
              children: [
                Text(
                  l10n?.uidType ?? 'UID类型:',
                  style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                ),
                CustomTextField(
                  controller: _controllerUID,
                  focusNode: _focusNodeUID,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    LengthLimitingTextInputFormatter(3),
                  ],
                  hintText: l10n?.requiredField ?? '必填项',
                  errorText: l10n?.invalidUid ?? 'UID值无效',
                  validator: (value) {
                    return value.isEmpty ||
                        int.tryParse(value) != null &&
                            int.tryParse(value)! >= 0 &&
                            int.tryParse(value)! <= 999;
                  },
                  onChanged: (value, _) {
                    selectedUID = int.tryParse(value);
                    widget.onChanged?.call((
                      selectedUID,
                      manualIGPUPath,
                      getIGPU,
                    ));
                  },
                ),
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: CustomDropdownButton(
                      value: _controllerUID.text,
                      placeholder: placeholder,
                      options: PNLFUIDs.map((item) {
                        final uid = item['UID'] as int;
                        final platform = item['Platform'] as String;
                        return DropdownOption(
                          value: uid.toString(),
                          label: 'UID: $uid  |  $platform',
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val == placeholder) {
                          _controllerUID.text = '';
                          selectedUID = null;
                        } else {
                          _controllerUID.text = val ?? '';
                          selectedUID = int.tryParse(val ?? '');
                        }
                        widget.onChanged?.call((
                          selectedUID,
                          manualIGPUPath,
                          getIGPU,
                        ));
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            TipSwitch(
              checked: getIGPU,
              title: l10n?.supplementIgpuRegisters ?? '是否补充IGPU寄存器信息',
              tip: l10n?.suggestIgpuRegisters ?? '当选择UID=14时,建议开启。如果不开启,可能会遇到最大亮度受限或其他问题',
              onChanged: (v) {
                getIGPU = v;
                widget.onChanged?.call((selectedUID, manualIGPUPath, v));
              },
            ),
          ],
        ),
      ),
    );
  }
}
