import 'package:bmi_calculator/calculatorBrain.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:flutter/material.dart';

void main() {
  test('Given user with obesity, when calculation called, then response alert',
      () async {
    // object
    final calBMI = CalculatorBrain(140, 160);
    // act
    calBMI.calculateBMI();
    // reply
    String bmiResult = calBMI.getResult();
    // assert
    expect(bmiResult, 'OverWeight');
  });
}
