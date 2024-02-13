import 'package:bmi_calculator/core/func/Response_Text.dart';
import 'package:bmi_calculator/core/widgets/CustomText.dart';
import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: CustomText(
      text: 'BMI Calculator',
      fontSize: RespText.getResponsiveFontSize(context, 20),
      fontWeight: FontWeight.bold,
    ),
  );
}
