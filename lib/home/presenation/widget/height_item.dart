import 'package:bmi_calculator/core/theme/style.dart';
import 'package:bmi_calculator/home/presenation/manager/cubit/bmi_calculator_cubit.dart';
import 'package:bmi_calculator/home/presenation/widget/height_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeightItem extends StatefulWidget {
  const HeightItem({super.key});
  @override
  State<HeightItem> createState() => _HeightItemState();
}

class _HeightItemState extends State<HeightItem> {
  double height = 175;

  final ScrollController _controller = ScrollController(
    initialScrollOffset: (175 - 100) * 10,
  );
  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      final cubit = context.read<BmiCalculatorCubit>();

      // كل 10px = 1 cm
      double currentValue = 100 + (_controller.offset / 10);

      // اقرب رقم صحيح
      int rounded = currentValue.round();

      if (rounded != cubit.height && rounded >= 100 && rounded <= 220) {
        cubit.changeHeight(rounded);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<BmiCalculatorCubit>();
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: .3),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // BIG NUMBER
          Center(
            child: Text(
              cubit.height.toString(),
              style: AppStyle.f18UrbanistBold,
            ),
          ),

          SizedBox(height: 16),
          HeightPicker(
            onValueChanged: (value) {
              cubit.changeHeight(value);
            },
          ),
        ],
      ),
    );
  }
}
