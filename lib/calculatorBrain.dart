import 'dart:math';

class CalculatorBrain {
  int weight;
  int height;
  double _bmi;

  CalculatorBrain(this.height, this.weight);

  String CalculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(
        1); //this will convert double to a string with 1 decimal point.
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeight';
    } else if (_bmi >= 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You should exercise more!!! Otherwise it will lead to a heart attack';
    } else if (_bmi >= 18.5) {
      return 'Follow your normal routine!! Don\'t change a single bit of it';
    } else {
      return 'Eat five to six smaller meals during the day, rather than two or three large meals ';
    }
  }
}
