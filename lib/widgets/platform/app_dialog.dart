import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:rapidssdt/widgets/platform/platform_utils.dart';

class AppDialog {
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget title,
    required Widget content,
    required Widget primaryButton,
    Widget? secondaryButton,
    Widget? icon,
  }) {
    if (PlatformUtils.isMacOS) {
      return showMacosAlertDialog<T>(
        context: context,
        builder: (context) {
          return MacosAlertDialog(
            appIcon: icon ?? const Icon(Icons.info),
            title: title,
            message: content,
            primaryButton: primaryButton,
            secondaryButton: secondaryButton,
          );
        },
      );
    }

    return showDialog<T>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            children: [
              if (icon != null) ...[
                icon,
                const SizedBox(width: 8),
              ],
              Expanded(child: title),
            ],
          ),
          content: content,
          actions: [
            if (secondaryButton != null) secondaryButton,
            primaryButton,
          ],
        );
      },
    );
  }
}
