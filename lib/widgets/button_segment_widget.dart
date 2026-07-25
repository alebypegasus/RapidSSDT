//  button_segment_widget.dart 
//  Created by JeoJay127 
//
import 'package:flutter/material.dart';

class ButtonSegmentWidget<T> extends StatefulWidget {
  const ButtonSegmentWidget({
    super.key,
    required this.values,
    required this.labelBuilder,
    this.onSelectionChanged,
    this.initialSelection,
  });

  final List<T> values;
  final String Function(T) labelBuilder;
  final ValueChanged<Set<T>>? onSelectionChanged;
  final Set<T>? initialSelection;

  @override
  State<ButtonSegmentWidget<T>> createState() => _ButtonSegmentWidgetState<T>();
}

class _ButtonSegmentWidgetState<T> extends State<ButtonSegmentWidget<T>> {
  late Set<T> selected;

  @override
  void initState() {
    super.initState();
    selected = widget.initialSelection ?? {widget.values.first};
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final themeColor = theme.colorScheme.primary;

    final segments = widget.values.map((val) {
      final isSelected = selected.contains(val);
      final text = widget.labelBuilder(val);
      return ButtonSegment<T>(
        value: val,
        label: Text(
          text,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : (isDarkMode ? Colors.grey[500] : Colors.black),
            fontSize: 11,
          ),
        ),
      );
    }).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SegmentedButton<T>(
        segments: segments,
        selected: selected,
        showSelectedIcon: false,
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          backgroundColor: WidgetStateColor.resolveWith(
            (states) => states.contains(WidgetState.selected)
                ? themeColor
                : Colors.transparent,
          ),
          side: WidgetStateBorderSide.resolveWith(
            (states) => BorderSide(
              color: Colors.grey.withAlpha(
                (255.0 * (isDarkMode ? 0.6 : 0.5)).round(),
              ),
            ),
          ),
        ),
        onSelectionChanged: (newSelection) {
          setState(() => selected = newSelection);
          widget.onSelectionChanged?.call(newSelection);
        },
      ),
    );
  }
}
