import 'package:bmi_calculator/core/theme/style.dart';
import 'package:bmi_calculator/home/data/model/gender_model.dart';
import 'package:bmi_calculator/home/presenation/widget/gender_item.dart';
import 'package:bmi_calculator/home/presenation/widget/spacing.dart';
import 'package:bmi_calculator/home/presenation/manager/cubit/bmi_calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderSection extends StatefulWidget {
  const GenderSection({super.key});

  @override
  State<GenderSection> createState() => _GenderSectionState();
}

class _GenderSectionState extends State<GenderSection> {
  List<GenderModel> genderList = [
    GenderModel(name: 'Female', icon: Icons.girl),
    GenderModel(name: 'Male', icon: Icons.boy),
  ];
  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<BmiCalculatorCubit>();
    return Column(
      children: [
        Text('Gender', style: AppStyle.f20UrbanistBold),
        verticalSpace(24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            genderList.length,
            (index) => Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  right: index == genderList.length - 1 ? 0 : 16,
                ),
                child: InkWell(
                  onTap: () {
                    cubit.changeGender(index);
                  },
                  child: GenderItem(
                    genderModel: genderList[index],
                    isActive: index == cubit.gender,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
