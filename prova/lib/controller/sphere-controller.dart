import '../model/sphere.dart';

class SphereController {
  final Sphere _sphere = Sphere(diameter: 0);

  void setDiameter(double diameter) {
    _sphere.diameter = diameter;
  }

  double getRadius() => _sphere.calculateRadius();
  double getSurfaceArea() => _sphere.calculateSurfaceArea();
  double getVolume() => _sphere.calculateVolume();
  bool isValid() => _sphere.isValid();
}
