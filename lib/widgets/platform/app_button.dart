import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:rapidssdt/widgets/platform/platform_utils.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool secondary;
  final ControlSize controlSize;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.secondary = false,
    this.controlSize = ControlSize.regular,
  });

  @override
  Widget build(BuildContext context) {
    if (PlatformUtils.isMacOS) {
      return PushButton(
        controlSize: controlSize,
        secondary: secondary,
        onPressed: onPressed,
        child: child,
      );
    }

    if (secondary) {
      return OutlinedButton(
        onPressed: onPressed,
        child: child,
      );
    }
    
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
