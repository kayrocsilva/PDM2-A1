import '../model/diamond.dart';

class DiamondController {
  final Diamond _diamond = Diamond(majorDiagonal: 0, minorDiagonal: 0);

  void setDimensions(double major, double minor) {
    _diamond.majorDiagonal = major;
    _diamond.minorDiagonal = minor;
  }

  double getArea() {
    return _diamond.calculateArea();
  }

  double getPerimeter() {
    return _diamond.calculatePerimeter();
  }

  bool isValid() {
    return _diamond.isValid();
  }
}
