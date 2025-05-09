import 'dart:math';

class Diamond {
  double majorDiagonal;
  double minorDiagonal;

  Diamond({required this.majorDiagonal, required this.minorDiagonal});

  bool isValid() {
    return majorDiagonal > 0 &&
        minorDiagonal > 0 &&
        majorDiagonal >= minorDiagonal;
  }

  double calculateArea() {
    return (majorDiagonal * minorDiagonal) / 2;
  }

  double calculatePerimeter() {
    // Using Pythagorean theorem to calculate side from diagonals
    final side = sqrt(pow(majorDiagonal / 2, 2) + pow(minorDiagonal / 2, 2));
    return 4 * side;
  }
}
