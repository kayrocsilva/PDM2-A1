import 'package:flutter/material.dart';
import '../controller/hexagon-controller.dart';

class HexagonResult extends StatelessWidget {
  final HexagonController controller;

  const HexagonResult({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final area = controller.obterArea();
    final perimetro = controller.obterPerimetro();
    final apotema = controller.obterApotema();
    final angulo = controller.obterAnguloInterno();

    return Scaffold(
      appBar: AppBar(title: const Text('Resultados - Hexágono')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Propriedades do Hexágono',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildResultadoItem(
                      'Área',
                      '${area.toStringAsFixed(2)} unidades²',
                    ),
                    _buildResultadoItem(
                      'Perímetro',
                      '${perimetro.toStringAsFixed(2)} unidades',
                    ),
                    _buildResultadoItem(
                      'Apótema',
                      '${apotema.toStringAsFixed(2)} unidades',
                    ),
                    _buildResultadoItem(
                      'Ângulo Interno',
                      '${angulo.toStringAsFixed(0)}°',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Voltar'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultadoItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 18)),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
