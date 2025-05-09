import '../model/parallelogram.dart';

class ParallelogramController {
  final Parallelogram _parallelogram = Parallelogram(base: 0, height: 0);

  void setDimensions(double base, double height) {
    _parallelogram.base = base;
    _parallelogram.height = height;
  }

  double getArea() => _parallelogram.calculateArea();
  double getPerimeter() => _parallelogram.calculatePerimeter();
  bool isValid() => _parallelogram.isValid();
}
