class Rectangle {
  double largura;
  double altura;

  Rectangle({required this.largura, required this.altura});

  double calcularArea() {
    return largura * altura;
  }

  double calcularPerimetro() {
    return 2 * (largura + altura);
  }

  double calcularDiagonal() {
    return (largura * largura + altura * altura);
  }
}
