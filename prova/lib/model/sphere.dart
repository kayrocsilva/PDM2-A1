import 'dart:math';

class Sphere {
  double diameter;

  Sphere({required this.diameter});

  bool isValid() {
    return diameter > 0;
  }

  double calculateRadius() {
    return diameter / 2;
  }

  double calculateSurfaceArea() {
    return 4 * pi * pow(calculateRadius(), 2);
  }

  double calculateVolume() {
    return (4 / 3) * pi * pow(calculateRadius(), 3);
  }
}
