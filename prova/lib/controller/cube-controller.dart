import '../model/cube.dart';

class CubeController {
  final Cube _cube = Cube(side: 0);

  void setSide(double side) {
    _cube.side = side;
  }

  double getVolume() => _cube.calculateVolume();
  double getSurfaceArea() => _cube.calculateSurfaceArea();
  double getSpaceDiagonal() => _cube.calculateSpaceDiagonal();
  bool isValid() => _cube.isValid();
}
