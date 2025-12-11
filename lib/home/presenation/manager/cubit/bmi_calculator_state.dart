part of 'bmi_calculator_cubit.dart';

@immutable
sealed class BmiCalculatorState {}

final class BmiCalculatorInitial extends BmiCalculatorState {}

final class GenderSuccess extends BmiCalculatorState {}

final class HeightSuccess extends BmiCalculatorState {}

final class AgeIncrementSuccess extends BmiCalculatorState {}

final class AgeDecrementSuccess extends BmiCalculatorState {}

final class WeightIncrementSuccess extends BmiCalculatorState {}

final class WeightDecrementSuccess extends BmiCalculatorState {}

// final class BmiSliderValueSucess extends BmiCalculatorState {}

final class BmiResultSucess extends BmiCalculatorState {}
