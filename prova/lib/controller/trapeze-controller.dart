import '../model/trapeze.dart';

class TrapezeController {
  final Trapeze _trapeze = Trapeze(largerBase: 0, smallerBase: 0, height: 0);

  void setDimensions(double largerBase, double smallerBase, double height) {
    _trapeze.largerBase = largerBase;
    _trapeze.smallerBase = smallerBase;
    _trapeze.height = height;
  }

  double getArea() => _trapeze.calculateArea();
  double getPerimeter() => _trapeze.calculatePerimeter();
  double getMedian() => _trapeze.calculateMedian();
  bool isValid() => _trapeze.isValid();
}
