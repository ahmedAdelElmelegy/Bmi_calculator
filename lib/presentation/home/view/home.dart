import 'package:bmi_calculator/presentation/home/view/widgets/Custom_AppBar.dart';
import 'package:bmi_calculator/presentation/home/view/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: const HomeViewBody(),
    );
  }
}
