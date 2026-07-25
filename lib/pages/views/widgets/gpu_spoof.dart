//  gpu_spoof.dart 
//  Created by JeoJay127 
//
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rapidssdt/pages/views/widgets/path_textfield.dart';
import 'package:rapidssdt/utils/dataset/pci_data.dart';
import 'package:rapidssdt/widgets/custom_dropdown_button.dart';
import 'package:rapidssdt/widgets/custom_textfield.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';
import 'package:rapidssdt/l10n/l10n_helper.dart';

class GpuSpoof extends StatefulWidget {
  const GpuSpoof({super.key, this.onChanged});
  final ValueChanged<(String, String, String)>? onChanged;
  @override
  State<GpuSpoof> createState() => _GpuSpoofState();
}

class _GpuSpoofState extends State<GpuSpoof> {
  late final TextEditingController _controllerFakeID = TextEditingController(
    text: '',
  );
  late final TextEditingController _controllerFakeModel = TextEditingController(
    text: '',
  );
  final FocusNode _focusNodeFakeid = FocusNode();
  final FocusNode _focusNodeFakeModel = FocusNode();
  String acpiPath = '\\_SB.PCI0.PEG0.PEGP';
  String? selectedComboBoxValue;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _notifyChange();
    });
  }

  @override
  void dispose() {
    _controllerFakeID.dispose();
    _controllerFakeModel.dispose();
    _focusNodeFakeid.dispose();
    _focusNodeFakeModel.dispose();
    super.dispose();
  }

  void _notifyChange() {
    widget.onChanged?.call((
      acpiPath,
      _controllerFakeID.text,
      _controllerFakeModel.text,
    ));
  }

  // 构建 ACPI 路径输入框
  Widget _buildAcpiPathInput(bool isDarkMode, AppLocalizations? l10n) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 15,
      children: [
        Text(
          l10n?.deviceAcpiPath ?? l10nGlobal.ssdtMsg500,
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
        ),
        Flexible(
          child: PathTextField(
            pathType: PathType.acpi,
            initialPath: acpiPath,
            onChanged: (value, _) {
              acpiPath = value;
              _notifyChange();
            },
          ),
        ),
      ],
    );
  }

  // 构建仿冒显卡 ID 数据库下拉框
  Widget _buildFakeIDDatabaseDropdown(bool isDarkMode, AppLocalizations? l10n) {
    final placeholder = l10n?.selectGpuToSpoof ?? l10nGlobal.ssdtMsg501;
    final gpuOptions = PciData.gpuInfoMap.keys.toList().reversed.map((
      originalId,
    ) {
      final gpuName = PciData.getGpuNameWithOriginId(originalId) ?? l10n?.unknownGpuModel ?? l10nGlobal.ssdtMsg502;
      final label = '$gpuName  :  [$originalId]';
      return DropdownOption(value: label, label: label);
    }).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          Text(
            l10n?.fakeGpuIdDatabase ?? l10nGlobal.ssdtMsg503,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          ),
          CustomDropdownButton(
            value: selectedComboBoxValue ?? placeholder,
            placeholder: placeholder,
            options: gpuOptions,
            onChanged: (selectedValue) {
              selectedComboBoxValue = selectedValue ?? '';

              if (selectedValue != null && selectedValue != placeholder) {
                final parts = selectedValue.split('  :  ');
                if (parts.length == 2) {
                  final originalId = parts[1].trim().replaceAll(
                    RegExp(r'^\[|\]$'),
                    '',
                  );
                  _controllerFakeID.text =
                      PciData.getDevicespoofId(originalId) ?? '';
                  _controllerFakeModel.text =
                      PciData.getGpuNameWithOriginId(originalId) ?? '';
                }
              } else {
                _controllerFakeID.text = '';
                _controllerFakeModel.text = '';
              }

              _notifyChange();
            },
          ),
        ],
      ),
    );
  }

  // 构建仿冒显卡 ID 输入框
  Widget _buildFakeIDInput(bool isDarkMode, AppLocalizations? l10n) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 12,
      children: [
        Text(
          l10nGlobal.ssdtMsg504(l10n?.fakeGpuId ?? l10nGlobal.ssdtMsg509.toString()),
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
        ),
        CustomTextField(
          controller: _controllerFakeID,
          focusNode: _focusNodeFakeid,
          keyboardType: TextInputType.text,
          textAlign: TextAlign.center,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9a-fA-F]')),
            LengthLimitingTextInputFormatter(4),
          ],
          hintText: l10n?.example73BF ?? l10nGlobal.ssdtMsg505,
          errorText: l10n?.require4HexChars ?? l10nGlobal.ssdtMsg506,
          validator: (value) {
            return value.length == 4 || value.isEmpty;
          },
          onChanged: (value, _) {
            _notifyChange();
          },
        ),
        Flexible(child: _buildFakeModelInput(isDarkMode, l10n)),
      ],
    );
  }

  // 构建仿冒显卡名称输入框
  Widget _buildFakeModelInput(bool isDarkMode, AppLocalizations? l10n) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 6,
      children: [
        Text(
          l10nGlobal.ssdtMsg507(l10n?.fakeGpuName ?? l10nGlobal.ssdtMsg510.toString()),
          style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
        ),
        Flexible(
          child: CustomTextField(
            controller: _controllerFakeModel,
            focusNode: _focusNodeFakeModel,
            hintText: l10n?.optionalGpuName ?? l10nGlobal.ssdtMsg508,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'[\u4e00-\u9fa5]')),
            ],
            onChanged: (value, _) => _notifyChange(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      constraints: BoxConstraints(minHeight: 60, minWidth: double.infinity),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(6),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAcpiPathInput(isDarkMode, l10n),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFakeIDDatabaseDropdown(isDarkMode, l10n),
                _buildFakeIDInput(isDarkMode, l10n),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
