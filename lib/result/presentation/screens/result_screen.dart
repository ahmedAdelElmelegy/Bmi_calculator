// ========================= BMI RESULT SCREEN (FIXED) =========================
import 'package:bmi_calculator/core/theme/colors.dart';
import 'package:bmi_calculator/core/theme/style.dart';
import 'package:bmi_calculator/home/presenation/manager/cubit/bmi_calculator_cubit.dart';
import 'package:bmi_calculator/home/presenation/widget/spacing.dart';
import 'package:bmi_calculator/result/presentation/widget/bmi_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  // ---------------- GAUGE SEGMENTS ----------------

  static List<Map<String, dynamic>> maleCategories = [
    {
      "catName": "Underweight",
      "catValue": "Below 18",
      "catColor": ColorManager.gauge1,
    },
    {
      "catName": "Normal",
      "catValue": "18 - 25",
      "catColor": ColorManager.gauge2,
    },
    {
      "catName": "Overweight",
      "catValue": "25 - 30",
      "catColor": ColorManager.gauge3,
    },
    {"catName": "Obesity", "catValue": "30+", "catColor": ColorManager.gauge5},
  ];

  static List<Map<String, dynamic>> femaleCategories = [
    {
      "catName": "Underweight",
      "catValue": "Below 18.0",
      "catColor": ColorManager.gauge1,
    },
    {
      "catName": "Normal",
      "catValue": "18.0 - 25",
      "catColor": ColorManager.gauge2,
    },
    {
      "catName": "Overweight",
      "catValue": "25 - 30",
      "catColor": ColorManager.gauge3,
    },
    {"catName": "Obesity", "catValue": "30+", "catColor": ColorManager.gauge5},
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<BmiCalculatorCubit>();
    final categories = cubit.gender == 1 ? maleCategories : femaleCategories;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.pop(context),
                        child: Icon(Icons.arrow_back),
                      ),
                      horizontalSpace(8),
                      Text('YOUR BMI', style: AppStyle.f16UrbanistBold),
                    ],
                  ),
                  Icon(Icons.info),
                ],
              ),

              SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpace(16),

                    SizedBox(
                      height: 200,
                      child: SfRadialGauge(
                        axes: <RadialAxis>[
                          RadialAxis(
                            minimum: 0,
                            maximum: 40,
                            ranges: <GaugeRange>[
                              GaugeRange(
                                startValue: 0,
                                endValue: 18,
                                color: ColorManager.gauge1,
                              ),
                              GaugeRange(
                                startValue: 18,
                                endValue: 25,
                                color: ColorManager.gauge2,
                              ),
                              GaugeRange(
                                startValue: 25,
                                endValue: 30,
                                color: ColorManager.gauge4,
                              ),
                              GaugeRange(
                                startValue: 30,
                                endValue: 40,
                                color: Colors.redAccent,
                              ),
                            ],
                            pointers: <GaugePointer>[
                              NeedlePointer(value: cubit.bmiValue),
                            ],
                            annotations: <GaugeAnnotation>[
                              GaugeAnnotation(
                                widget: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      cubit.bmiValue.toStringAsFixed(2),
                                      style: AppStyle.f14UrbanistReg,
                                    ),
                                    Text(
                                      cubit.bmiCategory,
                                      style: AppStyle.f12UrbanisRegular,
                                    ),
                                  ],
                                ),
                                angle: 90,
                                positionFactor: 0.5,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    verticalSpace(24),

                    Row(
                      children: [
                        Text(
                          'DETAILED RESULT',
                          style: AppStyle.f16UrbanistBold,
                        ),
                      ],
                    ),

                    verticalSpace(16),

                    if (cubit.resultDetail.isNotEmpty)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 16.h,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          border: Border.all(color: ColorManager.grey),
                        ),
                        child: Text(
                          cubit.resultDetail,
                          style: AppStyle.f14UrbanistReg,
                        ),
                      ),

                    verticalSpace(16),

                    Column(
                      children: List.generate(
                        categories.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                            bottom: index == categories.length - 1 ? 0 : 8.0,
                          ),
                          child: BmiCategoryItem(
                            categoryName: categories[index]['catName'],
                            categoryDes: categories[index]['catValue'],
                            categoryColor: categories[index]['catColor'],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
