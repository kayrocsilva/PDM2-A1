import '../model/triangle.dart';

class TriangleController {
  final Triangle _triangle = Triangle(ladoA: 0, ladoB: 0, ladoC: 0);

  void definirLados(double ladoA, double ladoB, double ladoC) {
    _triangle.ladoA = ladoA;
    _triangle.ladoB = ladoB;
    _triangle.ladoC = ladoC;
  }

  double obterArea() {
    return _triangle.calcularArea();
  }

  double obterPerimetro() {
    return _triangle.calcularPerimetro();
  }

  String obterTipo() {
    return _triangle.determinarTipo();
  }

  bool ehValido() {
    return _triangle.ehValido();
  }
}
