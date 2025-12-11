import 'package:bmi_calculator/core/theme/colors.dart';
import 'package:bmi_calculator/core/theme/style.dart';
import 'package:bmi_calculator/home/presenation/manager/cubit/bmi_calculator_cubit.dart';
import 'package:bmi_calculator/home/presenation/widget/spacing.dart';
import 'package:bmi_calculator/result/data/model/gauge_model.dart';
import 'package:bmi_calculator/result/presentation/widget/bmi_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pretty_gauge/pretty_gauge.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});
  static List<GaugeModel> gaugeModels = [
    GaugeModel(
      color: ColorManager.gauge1,
      label: 'Severe\nUnderweight',
      value: 40.0,
    ),
    GaugeModel(color: ColorManager.gauge2, label: 'Underweight', value: 6.0),
    GaugeModel(color: ColorManager.gauge3, label: 'Normal', value: 16.0),
    GaugeModel(color: ColorManager.gauge4, label: 'Overweight', value: 13.0),
    GaugeModel(color: ColorManager.gauge5, label: 'Obesity', value: 25.0),
  ];
  static List<Map<String, dynamic>> cateogyList = [
    {
      "catName": "Underweight",
      "catValue": "Below 18.5",
      "catColor": ColorManager.gauge1,
    },
    {
      "catName": "Normal",
      "catValue": "18.5 - 24.9",
      "catColor": ColorManager.gauge2,
    },
    {
      "catName": "Overweight",
      "catValue": "24.9 to 29.9",
      "catColor": ColorManager.gauge3,
    },
    {
      "catName": "Obesity",
      "catValue": "30 or greater",
      "catColor": ColorManager.gauge5,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<BmiCalculatorCubit>();
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
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back),
                      ),
                      horizontalSpace(8),
                      Text('YOUR BMi', style: AppStyle.f16UrbanistBold),
                    ],
                  ),
                  Icon(Icons.info),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    verticalSpace(16),
                    // your bmi
                    PrettyGauge(
                      gaugeSize: 200,
                      segments: gaugeModels
                          .map((e) => GaugeSegment(e.label, e.value, e.color))
                          .toList(),
                      currentValue: cubit.bmiValue,
                      displayWidget: Text(
                        cubit.bmiCategory,
                        style: AppStyle.f16UrbanistBold,
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
                        cateogyList.length,
                        (index) => Padding(
                          padding: EdgeInsets.only(
                            bottom: index == cateogyList.length - 1 ? 0 : 8.0,
                          ),
                          child: BmiCategoryItem(
                            categoryName: cateogyList[index]['catName'],
                            categoryDes: cateogyList[index]['catValue'],
                            categoryColor: cateogyList[index]['catColor'],
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
