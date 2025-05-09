import '../model/hexagon.dart';

class HexagonController {
  final Hexagon _hexagon = Hexagon(lado: 0);

  void definirLado(double lado) {
    _hexagon.lado = lado;
  }

  double obterArea() {
    return _hexagon.calcularArea();
  }

  double obterPerimetro() {
    return _hexagon.calcularPerimetro();
  }

  double obterApotema() {
    return _hexagon.calcularApotema();
  }

  double obterAnguloInterno() {
    return _hexagon.calcularAnguloInterno();
  }

  bool ehValido() {
    return _hexagon.ehValido();
  }
}
