import '../model/rectangle.dart';

class RectangleController {
  final Rectangle _rectangle = Rectangle(largura: 0, altura: 0);

  void definirDimensoes(double largura, double altura) {
    _rectangle.largura = largura;
    _rectangle.altura = altura;
  }

  double obterArea() {
    return _rectangle.calcularArea();
  }

  double obterPerimetro() {
    return _rectangle.calcularPerimetro();
  }

  double obterDiagonal() {
    return _rectangle.calcularDiagonal();
  }
}
