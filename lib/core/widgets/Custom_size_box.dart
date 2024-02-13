import 'package:flutter/material.dart';

class CustomSizeBox extends StatelessWidget {
  const CustomSizeBox({super.key, this.h, this.w});
  final double? h;
  final double? w;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: h == null ? size.height : size.height * h!,
      width: w == null ? size.width : size.width * w!,
    );
  }
}
