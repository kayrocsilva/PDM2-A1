class Triangle {
  double ladoA;
  double ladoB;
  double ladoC;

  Triangle({required this.ladoA, required this.ladoB, required this.ladoC});

  bool ehValido() {
    return ladoA + ladoB > ladoC &&
        ladoA + ladoC > ladoB &&
        ladoB + ladoC > ladoA;
  }

  double calcularPerimetro() {
    return ladoA + ladoB + ladoC;
  }

  double calcularArea() {
    if (!ehValido()) return 0;

    final s = calcularPerimetro() / 2;
    return (s * (s - ladoA) * (s - ladoB) * (s - ladoC));
  }

  String determinarTipo() {
    if (!ehValido()) return "Inválido";

    if (ladoA == ladoB && ladoB == ladoC) {
      return "Equilátero";
    } else if (ladoA == ladoB || ladoA == ladoC || ladoB == ladoC) {
      return "Isósceles";
    } else {
      return "Escaleno";
    }
  }
}
