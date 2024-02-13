import 'package:bmi_calculator/core/func/Response_Text.dart';
import 'package:bmi_calculator/core/widgets/CustomText.dart';
import 'package:bmi_calculator/core/widgets/Custom_size_box.dart';
import 'package:flutter/material.dart';

class CustomItem2 extends StatelessWidget {
  const CustomItem2(
      {super.key,
      required this.text1,
      required this.text2,
      required this.icon1,
      required this.icon2,
      this.onPresed1,
      this.onPresed2});
  final String text1;
  final String text2;
  final IconData icon1;
  final IconData icon2;
  final Function()? onPresed1;
  final Function()? onPresed2;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * .26,
      width: size.width * .46,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: text1,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: RespText.getResponsiveFontSize(context, 25),
          ),
          const CustomSizeBox(
            h: .03,
          ),
          CustomText(
            text: text2,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: RespText.getResponsiveFontSize(context, 25),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(onPressed: onPresed1, icon: Icon(icon1))),
              SizedBox(
                width: size.width * .03,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: IconButton(onPressed: onPresed2, icon: Icon(icon2)))
            ],
          )
        ],
      ),
    );
  }
}
