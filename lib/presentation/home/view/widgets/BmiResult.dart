import 'package:bmi_calculator/core/func/Response_Text.dart';
import 'package:bmi_calculator/core/widgets/CustomText.dart';
import 'package:bmi_calculator/core/widgets/Custom_size_box.dart';
import 'package:bmi_calculator/presentation/home/manager/cubit/bmi_calculator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<BmiCalculatorCubit, BmiCalculatorState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = BmiCalculatorCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            centerTitle: true,
            title: const CustomAppBartitle(),
            backgroundColor: Colors.black,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomSizeBox(
                  h: .1,
                ),
                CustomText(
                  text: "YOUR RESUIT",
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: RespText.getResponsiveFontSize(context, 30),
                ),
                const CustomSizeBox(
                  h: .05,
                ),
                Expanded(
                  child: Container(
                    height: size.height * .7,
                    width: size.width,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        const CustomSizeBox(
                          h: .01,
                        ),
                        CustomText(
                          text: "type : ${cubit.x.toString()}",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: RespText.getResponsiveFontSize(context, 35),
                        ),
                        const CustomSizeBox(
                          h: .01,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: " Age : ${cubit.age}",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize:
                                    RespText.getResponsiveFontSize(context, 30),
                              ),
                              CustomText(
                                text: " hight : ${cubit.valueSlider.toInt()}",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize:
                                    RespText.getResponsiveFontSize(context, 30),
                              ),
                            ],
                          ),
                        ),
                        CustomText(
                          text: " state : ${cubit.res}",
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                          fontSize: RespText.getResponsiveFontSize(context, 20),
                        ),
                        const CustomSizeBox(
                          h: .01,
                        ),
                        CustomText(
                          text: " BMI : ${cubit.bmiCalc.toDouble().ceil()}",
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: RespText.getResponsiveFontSize(context, 35),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CustomAppBartitle extends StatelessWidget {
  const CustomAppBartitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.purple,
        period: const Duration(seconds: 12),
        child: CustomText(
          text: "BmI RESUIT",
          fontWeight: FontWeight.bold,
          fontSize: RespText.getResponsiveFontSize(context, 30),
        ));
  }
}
