part of 'bmi_calculator_cubit.dart';

@immutable
sealed class BmiCalculatorState {}

final class BmiCalculatorInitial extends BmiCalculatorState {}

final class BmiCalculatorAddMaleOrFemaileSucess extends BmiCalculatorState {}

final class BmiIncrementAgeSucess extends BmiCalculatorState {}

final class BmidecrementWeightSucess extends BmiCalculatorState {}

final class BmiIncrementWeightSucess extends BmiCalculatorState {}

final class BmidecrementAgeSucess extends BmiCalculatorState {}

final class BmiSliderValueSucess extends BmiCalculatorState {}

final class BmiResultSucess extends BmiCalculatorState {}
