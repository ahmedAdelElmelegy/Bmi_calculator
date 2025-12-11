import 'package:bmi_calculator/core/theme/colors.dart';
import 'package:bmi_calculator/core/theme/style.dart';
import 'package:bmi_calculator/home/data/model/gender_model.dart';
import 'package:bmi_calculator/home/presenation/widget/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenderItem extends StatelessWidget {
  final bool isActive;
  final GenderModel genderModel;
  const GenderItem({
    super.key,
    required this.genderModel,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isActive
            ? ColorManager.primary.withValues(alpha: .15)
            : ColorManager.white,
        border: Border.all(
          color: isActive ? ColorManager.primary : ColorManager.grey,
        ),
      ),
      child: Column(
        children: [
          Icon(genderModel.icon, color: ColorManager.primary, size: 60.sp),
          verticalSpace(8),
          Text(genderModel.name, style: AppStyle.f16UrbanistBold),
        ],
      ),
    );
  }
}
