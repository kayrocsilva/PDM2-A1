import 'dart:math';

class Square {
  double side;

  Square({required this.side});

  bool isValid() {
    return side > 0;
  }

  double calculateArea() {
    return side * side;
  }

  double calculatePerimeter() {
    return 4 * side;
  }

  double calculateDiagonal() {
    return side * sqrt(2);
  }
}
