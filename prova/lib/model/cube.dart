import 'dart:math';

class Cube {
  double side;

  Cube({required this.side});

  bool isValid() {
    return side > 0;
  }

  double calculateVolume() {
    return pow(side, 3).toDouble();
  }

  double calculateSurfaceArea() {
    return 6 * pow(side, 2).toDouble();
  }

  double calculateSpaceDiagonal() {
    return side * sqrt(3);
  }
}
