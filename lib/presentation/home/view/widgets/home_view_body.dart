import 'package:bmi_calculator/core/func/Response_Text.dart';
import 'package:bmi_calculator/core/widgets/CustomText.dart';
import 'package:bmi_calculator/core/widgets/Custom_size_box.dart';
import 'package:bmi_calculator/presentation/home/manager/cubit/bmi_calculator_cubit.dart';
import 'package:bmi_calculator/presentation/home/view/widgets/BmiResult.dart';
import 'package:bmi_calculator/presentation/home/view/widgets/CustomItem2.dart';
import 'package:bmi_calculator/presentation/home/view/widgets/Custom_Bmi_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<BmiCalculatorCubit, BmiCalculatorState>(
      listener: (context, state) {
        if (state is BmiResultSucess) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const BmiResult();
            },
          ));
        }
      },
      builder: (context, state) {
        var cubit = BmiCalculatorCubit.get(context);
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        cubit.setMale(xstate: 'Male');
                      },
                      child: CustomBmIItem(
                        text: 'Male',
                        icon: Icons.male,
                        border: cubit.border2,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        cubit.setFemale(xstate: 'Female');
                      },
                      child: CustomBmIItem(
                        text: 'Female',
                        icon: Icons.female,
                        border: cubit.border,
                      ),
                    ),
                  ],
                ),
                const CustomSizeBox(h: .02),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20)),
                  height: size.height * .23,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: 'hight',
                        fontSize: RespText.getResponsiveFontSize(context, 25),
                        fontWeight: FontWeight.bold,
                      ),
                      CustomText(text: '${cubit.valueSlider.toInt()}'),
                      Slider(
                        value: cubit.valueSlider,
                        max: 200,
                        min: 0,
                        onChanged: (value) {
                          cubit.fetchSliderData(value);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomItem2(
                        onPresed1: () {
                          cubit.incrementAge();
                        },
                        onPresed2: () {
                          cubit.decrmentAge();
                        },
                        text1: 'Age',
                        text2: cubit.age.toString(),
                        icon1: Icons.add,
                        icon2: Icons.remove),
                    CustomItem2(
                        onPresed1: () {
                          cubit.incrementWeight();
                        },
                        onPresed2: () {
                          cubit.decrmentWeight();
                        },
                        text1: 'weight',
                        text2: cubit.weight.toString(),
                        icon1: Icons.add,
                        icon2: Icons.remove),
                  ],
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.symmetric(
                            horizontal: size.width * .36,
                            vertical: size.height * .02)),
                    onPressed: () {
                      cubit.getResult();
                    },
                    child: const CustomText(
                      text: 'CALCULATE',
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
