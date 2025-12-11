import 'package:bmi_calculator/core/theme/style.dart';
import 'package:bmi_calculator/home/presenation/widget/height_item.dart';
import 'package:bmi_calculator/home/presenation/widget/spacing.dart';
import 'package:flutter/material.dart';

class HeightSection extends StatefulWidget {
  const HeightSection({super.key});

  @override
  State<HeightSection> createState() => _HeightSectionState();
}

class _HeightSectionState extends State<HeightSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("HEIGHT", style: AppStyle.f16UrbanistBold),
            Text("CM", style: AppStyle.f14Urbanistbold),
          ],
        ),
        verticalSpace(16),
        HeightItem(),
      ],
    );
  }
}
