//  path_textfield.dart 
//  Created by JeoJay127 
//
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rapidssdt/utils/ssdttool/util.dart';
import 'package:rapidssdt/widgets/custom_textfield.dart';
import 'package:rapidssdt/l10n/app_localizations.dart';

enum PathType {
  acpi,
  pci,
}

class PathTextField<T> extends StatefulWidget {
  const PathTextField({
    super.key,
    required this.pathType,
    this.onChanged,
    this.initialPath, 
    this.hintText, 
    this.errorText, 
  });

  final PathType pathType;
  final void Function(String value, T? extra)? onChanged;
  final String? initialPath;
  final String? hintText;
  final String? errorText;

  @override
  State<PathTextField> createState() => _PathTextFieldState();
}

class _PathTextFieldState extends State<PathTextField> {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  String _getDefaultHintText(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    switch (widget.pathType) {
      case PathType.acpi:
        return l10n?.fillAcpiPath ?? '填写ACPI路径';
      case PathType.pci:
        return l10n?.fillPciPath ?? '填写PCI路径';
    }
  }

  // 根据路径类型获取默认错误文本
  String _getDefaultErrorText(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    switch (widget.pathType) {
      case PathType.acpi:
        return l10n?.invalidAcpiPath ?? '无效ACPI路径';
      case PathType.pci:
        return l10n?.invalidPciPath ?? '无效PCI路径';
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialPath);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onChanged?.call(_controller.text, null);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: _controller,
      focusNode: _focusNode,
      hintText: widget.hintText ?? _getDefaultHintText(context),
      errorText: widget.errorText ?? _getDefaultErrorText(context),
      // 输入过滤（禁止汉字）
      inputFormatters: [
        FilteringTextInputFormatter.deny(
          RegExp(r'[\u4e00-\u9fa5]'),
        ),
      ],
      validator: (value) =>
          value.isEmpty || _validatePath(value, widget.pathType),
      onChanged: (value, extra) {
        widget.onChanged?.call(value, extra);
      },
    );
  }

  bool _validatePath(String value, PathType type) {
    switch (type) {
      case PathType.acpi:
        return Util().checkACPIPath(acpiPath: value);
      case PathType.pci:
        return Util().checkPCIPath(pciPath: value);
    }
  }
}