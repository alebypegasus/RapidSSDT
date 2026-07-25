//  custom_textfield.dart 
//  Created by JeoJay127 
//
import 'package:flutter/material.dart' hide TextField;
import 'package:flutter/services.dart';
import 'package:macos_ui/macos_ui.dart';

/// 自定义十六进制输入框组件，支持暗黑模式、自定义样式、输入校验、格式限制等。
class CustomTextField<T> extends StatefulWidget {
  /// 最小宽度
  final double minWidth;

  /// 最大宽度
  final double maxWidth;

  /// 输入框控制器
  final TextEditingController controller;

  /// 焦点控制器
  final FocusNode focusNode;

  /// 键盘类型（默认：文本）
  final TextInputType keyboardType;

  /// 输入对齐方式（默认：居中）
  final TextAlign textAlign;

  /// 输入格式限制（如只能输入十六进制，长度限制等）
  final List<TextInputFormatter> inputFormatters;

  /// 文本样式
  final TextStyle? style;

  /// 提示文本
  final String? hintText;

  /// 提示文本样式
  final TextStyle? hintStyle;

  /// 错误文本样式
  final TextStyle? errorStyle;

  /// 错误文本内容（仅在校验不通过时显示）
  final String? errorText;

  /// 默认边框（未聚焦/未激活）
  final InputBorder? border;

  /// 启用状态边框颜色 & 宽度
  final Color? enabledBorderColor;
  final double? enabledBorderWidth;

  /// 聚焦状态边框颜色 & 宽度
  final Color? focusedBorderColor;
  final double? focusedBorderWidth;

  /// 错误状态边框颜色 & 宽度
  final Color? errorBorderColor;
  final double? errorBorderWidth;

  /// 聚焦+错误状态边框颜色 & 宽度
  final Color? focusedErrorBorderColor;
  final double? focusedErrorBorderWidth;

  /// 输入变化时触发校验逻辑
  final bool Function(String value)? validator;

  /// 输入变化时触发回调，支持传递附加参数
  final void Function(String value, T? extra)? onChanged;

  /// 附加参数，供回调使用
  final T? extra;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.minWidth = 40,
    this.maxWidth = double.infinity,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.left,
    this.inputFormatters = const [],
    this.style,
    this.hintText,
    this.hintStyle,
    this.errorStyle,
    this.errorText,
    this.border,
    this.enabledBorderColor,
    this.enabledBorderWidth,
    this.focusedBorderColor,
    this.focusedBorderWidth,
    this.errorBorderColor,
    this.errorBorderWidth,
    this.focusedErrorBorderColor,
    this.focusedErrorBorderWidth,
    this.validator,
    this.onChanged,
    this.extra,
  });

  @override
  State<CustomTextField<T>> createState() => _CustomTextFieldState<T>();
}

class _CustomTextFieldState<T> extends State<CustomTextField<T>> {
  String? _effectiveErrorText;
  final String defaultErrorText = '输入不合法';
  late final VoidCallback _listener;

  @override
  void initState() {
    super.initState();
    _listener = () => _validate(widget.controller.text);
    widget.controller.addListener(_listener);
    _validate(widget.controller.text);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listener);
    super.dispose();
  }

  bool _validate(String value) {
    final isValid = widget.validator?.call(value) ?? true;
    setState(() {
      _effectiveErrorText = isValid
          ? null
          : (widget.errorText ?? defaultErrorText);
    });
    return isValid;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final input = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MacosTextField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType: widget.keyboardType,
          textAlign: widget.textAlign,
          inputFormatters: widget.inputFormatters,
          style: widget.style ?? const TextStyle(fontSize: 11),
          placeholder: widget.hintText,
          placeholderStyle: widget.hintStyle ??
              TextStyle(
                fontSize: 11,
                color: isDarkMode ? Colors.grey.shade500 : Colors.grey.shade400,
              ),
          decoration: BoxDecoration(
            border: Border.all(
              color: _effectiveErrorText != null
                  ? (widget.errorBorderColor ?? Colors.red.shade600)
                  : (widget.enabledBorderColor ?? MacosColors.controlColor),
              width: _effectiveErrorText != null
                  ? (widget.errorBorderWidth ?? 1.0)
                  : (widget.enabledBorderWidth ?? 1.0),
            ),
            borderRadius: BorderRadius.circular(4.0),
            color: isDarkMode
                ? MacosColors.controlBackgroundColor.darkColor
                : MacosColors.controlBackgroundColor,
          ),
          onChanged: (value) {
            bool isValid = _validate(value);
            widget.onChanged?.call(isValid ? value : '', widget.extra);
          },
        ),
        if (_effectiveErrorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              _effectiveErrorText!,
              style: widget.errorStyle ??
                  TextStyle(color: Colors.red.shade600, fontSize: 10),
            ),
          ),
      ],
    );

    return IntrinsicWidth(
      stepWidth: 10,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: widget.minWidth,
          maxWidth: widget.maxWidth,
        ),
        child: input,
      ),
    );
  }
}
