//  toggle.dart 
//  Created by JeoJay127 
//
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

class ToggleSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double width;
  final double height;
  final Color activeColor;
  final Color inactiveColor;
  final Duration duration;
  final String? text;

  const ToggleSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.text,
    this.width = 40,
    this.height = 20,
    this.activeColor = Colors.blue,
    this.inactiveColor = Colors.grey,
    this.duration = const Duration(milliseconds: 200),
  });

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch>
    with SingleTickerProviderStateMixin {
  late bool _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.value;
  }

  @override
  void didUpdateWidget(ToggleSwitch oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _currentValue = widget.value;
    }
  }

  void _toggle() {
    setState(() {
      _currentValue = !_currentValue;
    });
    widget.onChanged(_currentValue);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggle,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 15,
        children: [
          if (widget.text != null)
            Text(widget.text!, style: const TextStyle(fontSize: 11)),
          MacosSwitch(
            value: _currentValue,
            onChanged: (v) {
              setState(() {
                _currentValue = v;
              });
              widget.onChanged(v);
            },
            activeColor: MacosColor(widget.activeColor.value),
          ),
        ],
      ),
    );
  }
}
