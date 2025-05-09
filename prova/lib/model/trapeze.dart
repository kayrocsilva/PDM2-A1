import 'dart:math';

class Trapeze {
  double largerBase;
  double smallerBase;
  double height;
  double side1;
  double side2;

  Trapeze({
    required this.largerBase,
    required this.smallerBase,
    required this.height,
    this.side1 = 0,
    this.side2 = 0,
  });

  bool isValid() {
    return largerBase > 0 &&
        smallerBase > 0 &&
        height > 0 &&
        largerBase > smallerBase;
  }

  double calculateArea() {
    return ((largerBase + smallerBase) * height) / 2;
  }

  double calculatePerimeter() {
    // If sides aren't provided, calculate using Pythagorean theorem
    if (side1 == 0 || side2 == 0) {
      final baseDifference = (largerBase - smallerBase).abs();
      final side = sqrt(pow(height, 2) + pow(baseDifference / 2, 2));
      return largerBase + smallerBase + 2 * side;
    }
    return largerBase + smallerBase + side1 + side2;
  }

  double calculateMedian() {
    return (largerBase + smallerBase) / 2;
  }
}
