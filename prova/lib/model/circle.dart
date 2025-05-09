import 'dart:math';

class Circle {
  double diameter;

  Circle({required this.diameter});

  bool isValid() {
    return diameter > 0;
  }

  double calculateRadius() {
    return diameter / 2;
  }

  double calculateArea() {
    return pi * pow(calculateRadius(), 2);
  }

  double calculatePerimeter() {
    return pi * diameter;
  }
}
