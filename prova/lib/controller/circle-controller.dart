import '../model/circle.dart';

class CircleController {
  final Circle _circle = Circle(diameter: 0);

  void setDiameter(double diameter) {
    _circle.diameter = diameter;
  }

  double getArea() {
    return _circle.calculateArea();
  }

  double getPerimeter() {
    return _circle.calculatePerimeter();
  }

  double getRadius() {
    return _circle.calculateRadius();
  }

  bool isValid() {
    return _circle.isValid();
  }
}
