import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bmi_calculator_state.dart';

class BmiCalculatorCubit extends Cubit<BmiCalculatorState> {
  BmiCalculatorCubit() : super(BmiCalculatorInitial());
  // male 1 female 0
  int gender = -1;
  int height = 100;
  int age = 1;
  int weight = 1;
  // for result
  String resultDetail = '';
  double bmiValue = 0;
  String bmiCategory = '';
  // change male to female
  void changeGender(int value) {
    gender = value;
    emit(GenderSuccess());
  }

  // update value
  void changeHeight(int value) {
    height = value;
    debugPrint(height.toString());
    emit(HeightSuccess());
  }

  // change age
  void incrementAge() {
    age = age + 1;
    debugPrint(height.toString());
    emit(AgeIncrementSuccess());
  }

  void decrementAge() {
    if (age > 0) {
      age = age - 1;
      debugPrint(height.toString());
      emit(AgeDecrementSuccess());
    }
  }

  // inc and dec weight
  void incrementWeight() {
    weight = weight + 1;
    debugPrint(height.toString());
    emit(WeightIncrementSuccess());
  }

  void decrementWeight() {
    if (weight > 0) {
      weight = weight - 1;
      debugPrint(height.toString());
      emit(WeightDecrementSuccess());
    }
  }

  // calculate bmi 2 gen category
  void calculateBMI() {
    double heightM = height / 100; // convert cm to meters
    double bmi = weight / (heightM * heightM);
    bmiValue = bmi;
    calculateBmiCategoryAndDetail(bmi);
    BmiResultSucess();
  }

  void calculateBmiCategoryAndDetail(double bmi) {
    String genderString = gender == 1 ? 'Male' : 'Female';

    if (gender == 1) {
      // ----------- MALE -----------
      if (bmi < 18.5) {
        bmiCategory = "Underweight";
        resultDetail =
            "Your BMI indicates that you are under the healthy weight range.\n"
            "Health Risks: Weakened immunity, fatigue, nutritional deficiencies, lower muscle mass.\n"
            "Recommendation: Increase calorie intake with nutritious foods.\n"
            "Gender: $genderString • Age: $age";
      } else if (bmi < 25) {
        bmiCategory = "Normal";
        resultDetail =
            "Your BMI is within the healthy range.\n"
            "Health Risks: Lowest risk for most weight-related issues.\n"
            "Recommendation: Maintain a balanced diet and stay active.\n"
            "Gender: $genderString • Age: $age";
      } else if (bmi < 30) {
        bmiCategory = "Overweight";
        resultDetail =
            "Your BMI is slightly above the ideal range.\n"
            "Health Risks: Higher risk of diabetes and high blood pressure.\n"
            "Recommendation: Reduce sugar, increase activity.\n"
            "Gender: $genderString • Age: $age";
      } else {
        bmiCategory = "Obesity";
        resultDetail =
            "Your BMI indicates obesity.\n"
            "Health Risks: Heart disease, sleep apnea, diabetes.\n"
            "Recommendation: Follow a structured weight-loss program.\n"
            "Gender: $genderString • Age: $age";
      }
    } else {
      // ----------- FEMALE -----------
      if (bmi < 18.0) {
        bmiCategory = "Underweight";
        resultDetail =
            "Your BMI indicates that you are under the healthy weight range.\n"
            "Gender: $genderString • Age: $age";
      } else if (bmi < 24.5) {
        bmiCategory = "Normal";
        resultDetail =
            "Your BMI is within the healthy range.\n"
            "Gender: $genderString • Age: $age";
      } else if (bmi < 30) {
        bmiCategory = "Overweight";
        resultDetail =
            "Your BMI is slightly above the ideal range.\n"
            "Gender: $genderString • Age: $age";
      } else {
        bmiCategory = "Obesity";
        resultDetail =
            "Your BMI indicates obesity.\n"
            "Gender: $genderString • Age: $age";
      }
    }

    debugPrint(bmiCategory);
  }
}
