//  radio_option_item.dart 
//  Created by JeoJay127 
//
import 'package:flutter/material.dart' hide Radio;
import 'package:macos_ui/macos_ui.dart';

class RadioOptionItem extends StatelessWidget {
  final String value;
  final String groupValue;
  final String label;
  final double radioScale;
  final ValueChanged<String> onChanged;

  const RadioOptionItem({
    super.key,
    required this.value,
    required this.groupValue,
    required this.label,
    this.radioScale = 1.0,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        color: Colors.transparent, // Ensures tap events are captured
        padding: const EdgeInsets.only(left: 3, right: 9),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Transform.scale(
              scale: radioScale,
              child: MacosRadioButton<String>(
                value: value,
                groupValue: groupValue,
                onChanged: (val) {
                  if (val != null) {
                    onChanged(val);
                  }
                },
              ),
            ),
            Text(label, style: const TextStyle(fontSize: 11)),
          ],
        ),
      ),
    );
  }
}
