import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:rapidssdt/widgets/platform/platform_utils.dart';

class AppDropdownMenuItem<T> {
  final T value;
  final Widget child;

  const AppDropdownMenuItem({
    required this.value,
    required this.child,
  });
}

class AppDropdown<T> extends StatelessWidget {
  final T value;
  final ValueChanged<T?>? onChanged;
  final List<AppDropdownMenuItem<T>> items;

  const AppDropdown({
    super.key,
    required this.value,
    required this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    if (PlatformUtils.isMacOS) {
      return MacosPopupButton<T>(
        value: value,
        onChanged: onChanged,
        items: items.map((item) {
          return MacosPopupMenuItem<T>(
            value: item.value,
            child: item.child,
          );
        }).toList(),
      );
    }

    return DropdownButton<T>(
      value: value,
      onChanged: onChanged,
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item.value,
          child: item.child,
        );
      }).toList(),
    );
  }
}
