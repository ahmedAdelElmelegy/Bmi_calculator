import 'package:bmi_calculator/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:simple_ruler_picker/simple_ruler_picker.dart';

class HeightPicker extends StatelessWidget {
  final void Function(int)? onValueChanged;

  const HeightPicker({super.key, this.onValueChanged});

  @override
  Widget build(BuildContext context) {
    return SimpleRulerPicker(
      selectedColor: ColorManager.primary,
      height: 100,
      minValue: 0,
      maxValue: 250,
      initialValue: 100,
      onValueChanged: onValueChanged,
    );
  }
}
