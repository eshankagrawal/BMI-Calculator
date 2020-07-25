import 'dart:math';
class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calcBmi() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25)
      return "overwieght";
    else if (_bmi <= 18)
      return "underweight";
    else
      return "normal";
  }
  String getInterpretation() {
    if (_bmi >= 25)
      return "you have higher body wiegt.Try to exercise more";
    else if (_bmi <= 18)
      return "Try to eat healthy food and take proper nutrition.";
    else
      return  "you have normal body weight.Keep it up.";
  }
}