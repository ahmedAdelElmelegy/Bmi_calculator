import 'package:bmi_calculator/core/theme/style.dart';
import 'package:bmi_calculator/home/presenation/manager/cubit/bmi_calculator_cubit.dart';
import 'package:bmi_calculator/home/presenation/widget/age_section.dart';
import 'package:bmi_calculator/home/presenation/widget/custom_btn.dart';
import 'package:bmi_calculator/home/presenation/widget/gender_section.dart';
import 'package:bmi_calculator/home/presenation/widget/height_section.dart';
import 'package:bmi_calculator/home/presenation/widget/spacing.dart';
import 'package:bmi_calculator/home/presenation/widget/weight_section.dart';
import 'package:bmi_calculator/result/presentation/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'BMI Calculator',
                        style: AppStyle.f22UrbanistExraBold,
                      ),
                    ),
                    verticalSpace(24),
                    // gender
                    GenderSection(),
                    verticalSpace(24),
                    //  height
                    HeightSection(),
                    verticalSpace(24),
                    Row(
                      children: [
                        // age
                        Expanded(child: AgeSection()),
                        horizontalSpace(16),
                        Expanded(child: WeightSection()),
                      ],
                    ),
                  ],
                ),
              ),
              CusomButton(
                text: 'Calculate BMI',
                onPressed: () {
                  final cubit = context.read<BmiCalculatorCubit>();
                  if (cubit.age > 1 &&
                      cubit.height > 99 &&
                      cubit.weight > 1 &&
                      cubit.gender > -1) {
                    cubit.calculateBMI();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResultScreen()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'Please fill all the fields',
                          style: AppStyle.f14Urbanistbold,
                        ),
                      ),
                    );
                  }
                },
              ),
              verticalSpace(16),
            ],
          ),
        ),
      ),
    );
  }
}
