import 'package:bmi_calculator/core/func/Response_Text.dart';
import 'package:bmi_calculator/core/widgets/CustomText.dart';
import 'package:bmi_calculator/core/widgets/Custom_size_box.dart';
import 'package:flutter/material.dart';

class CustomBmIItem extends StatelessWidget {
  const CustomBmIItem({
    super.key,
    this.border,
    required this.text,
    this.icon,
  });
  final bool? border;
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .25,
      width: size.width * .46,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(20),
          border: border == true
              ? Border.all(width: 5, color: Colors.orange)
              : Border.all(color: Colors.blue)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 60,
            color: Colors.white,
          ),
          const CustomSizeBox(
            h: .03,
          ),
          CustomText(
            text: text,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: RespText.getResponsiveFontSize(context, 25),
          ),
        ],
      ),
    );
  }
}
