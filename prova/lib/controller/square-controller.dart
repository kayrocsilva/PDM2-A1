import '../model/square.dart';

class SquareController {
  final Square _square = Square(side: 0);

  void setSide(double side) {
    _square.side = side;
  }

  double getArea() {
    return _square.calculateArea();
  }

  double getPerimeter() {
    return _square.calculatePerimeter();
  }

  double getDiagonal() {
    return _square.calculateDiagonal();
  }

  bool isValid() {
    return _square.isValid();
  }
}
