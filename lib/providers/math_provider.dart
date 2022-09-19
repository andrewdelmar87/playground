import 'package:flutter/material.dart';

class Math with ChangeNotifier {
  int result = 0;

  void add(int firstNumber, int secondNumber) {
    result = firstNumber + secondNumber;
    notifyListeners();
  }

  void subtract(int firstNumber, int secondNumber) {
    result = firstNumber - secondNumber;
    notifyListeners();
  }

  void multiply(int firstNumber, int secondNumber) {
    result = firstNumber * secondNumber;
    notifyListeners();
  }
}
