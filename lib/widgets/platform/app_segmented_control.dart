import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:rapidssdt/widgets/platform/platform_utils.dart';

class AppSegmentedControl extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onValueChanged;
  final List<String> labels;

  const AppSegmentedControl({
    super.key,
    required this.currentIndex,
    required this.onValueChanged,
    required this.labels,
  });

  @override
  Widget build(BuildContext context) {
    if (PlatformUtils.isMacOS) {
      // Create a temporary controller just for this build to interface with MacosSegmentedControl
      // Or we can just use CupertinoSlidingSegmentedControl which MacosSegmentedControl wraps.
      final controller = MacosTabController(
        initialIndex: currentIndex,
        length: labels.length,
      );
      
      // We need to use CupertinoSlidingSegmentedControl since MacosSegmentedControl requires a controller
      // and managing its lifecycle here inside build is anti-pattern.
      return CupertinoSlidingSegmentedControl<int>(
        groupValue: currentIndex,
        onValueChanged: (v) {
          if (v != null) onValueChanged(v);
        },
        children: {
          for (int i = 0; i < labels.length; i++)
            i: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(labels[i]),
            ),
        },
      );
    }

    return SegmentedButton<int>(
      segments: [
        for (int i = 0; i < labels.length; i++)
          ButtonSegment<int>(
            value: i,
            label: Text(labels[i]),
          ),
      ],
      selected: {currentIndex},
      onSelectionChanged: (Set<int> newSelection) {
        onValueChanged(newSelection.first);
      },
    );
  }
}
