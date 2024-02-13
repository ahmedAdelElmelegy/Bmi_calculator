import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'bmi_calculator_state.dart';

class BmiCalculatorCubit extends Cubit<BmiCalculatorState> {
  BmiCalculatorCubit() : super(BmiCalculatorInitial());
  static BmiCalculatorCubit get(context) => BlocProvider.of(context);
  String? x;
  bool border2 = false;
  void setFemale({required String xstate}) {
    x = xstate;
    border = !border;
    border2 = false;
    print(x);
    emit(BmiCalculatorAddMaleOrFemaileSucess());
  }

  bool border = false;
  void setMale({required String xstate}) {
    x = xstate;
    border2 = !border2;
    border = false;

    emit(BmiCalculatorAddMaleOrFemaileSucess());
    print(x);
  }

  int age = 0;
  int weight = 0;
  void incrementAge() {
    age = age + 1;
    emit(BmiIncrementAgeSucess());
  }

  void decrmentAge() {
    if (age > 0) {
      age = age - 1;
      emit(BmidecrementAgeSucess());
    } else {
      return;
    }
  }

  void incrementWeight() {
    weight = weight + 1;
    emit(BmiIncrementWeightSucess());
  }

  void decrmentWeight() {
    if (weight > 0) {
      weight = weight - 1;
      emit(BmidecrementWeightSucess());
    } else {
      return;
    }
  }

  double valueSlider = 0;
  void fetchSliderData(double value) {
    valueSlider = value;
    emit(BmiSliderValueSucess());
  }

  double bmiCalc = 0;
  String res = '';
  void getResult() {
    bmiCalc = weight / pow(valueSlider / 100, 2);

    switch (bmiCalc) {
      case < 16:
        res = 'Severe Thinness';
        break;
      case > 18.5 && < 25:
        res = 'Normal';
        break;
      case > 25 && < 30:
        res = 'Over weight';
        break;
      case > 30:
        res = 'Obese';
        break;
      default:
    }
    emit(BmiResultSucess());
    print(res);
  }
}
