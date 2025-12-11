import 'package:bmi_calculator/core/theme/colors.dart';
import 'package:bmi_calculator/core/theme/style.dart';
import 'package:flutter/material.dart';

class BmiCategoryItem extends StatelessWidget {
  final String categoryName;
  final String categoryDes;
  final Color categoryColor;
  const BmiCategoryItem({
    super.key,
    required this.categoryName,
    required this.categoryDes,
    required this.categoryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: ColorManager.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(categoryName, style: AppStyle.f14Urbanistbold),
          Text(categoryDes, style: AppStyle.f14UrbanistReg),
          Container(
            height: 10,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: categoryColor,
            ),
          ),
        ],
      ),
    );
  }
}
