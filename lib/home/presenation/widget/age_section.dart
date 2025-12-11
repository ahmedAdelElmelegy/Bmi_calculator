import 'package:bmi_calculator/core/theme/colors.dart';
import 'package:bmi_calculator/core/theme/style.dart';
import 'package:bmi_calculator/home/presenation/widget/spacing.dart';
import 'package:bmi_calculator/home/presenation/manager/cubit/bmi_calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgeSection extends StatelessWidget {
  const AgeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<BmiCalculatorCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [Text('AGE', style: AppStyle.f16UrbanistBold)]),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          decoration: BoxDecoration(
            border: Border.all(color: ColorManager.grey),
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIcon(
                icon: Icons.add_circle,
                onTap: () {
                  cubit.incrementAge();
                },
              ),
              horizontalSpace(8),
              Text('${cubit.age}', style: AppStyle.f16UrbanistBold),
              horizontalSpace(8),
              CustomIcon(
                icon: Icons.remove_circle,

                onTap: () {
                  cubit.decrementAge();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final void Function()? onTap;
  const CustomIcon({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(icon),
      color: ColorManager.primary,
    );
  }
}
