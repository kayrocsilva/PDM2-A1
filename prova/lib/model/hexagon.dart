class Hexagon {
  double lado;

  Hexagon({required this.lado});

  bool ehValido() {
    return lado > 0;
  }

  double calcularPerimetro() {
    return 6 * lado;
  }

  double calcularArea() {
    return (3 * lado * lado) * (3 / 2);
  }

  double calcularApotema() {
    return (lado * 3) / 2;
  }

  double calcularAnguloInterno() {
    return 120.0; // Ângulo interno de um hexágono regular
  }
}
