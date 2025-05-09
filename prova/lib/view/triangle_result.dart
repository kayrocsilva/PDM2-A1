import 'package:flutter/material.dart';
import '../controller/triangle-controller.dart';

class TriangleResult extends StatelessWidget {
  final TriangleController controller;

  const TriangleResult({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final area = controller.obterArea();
    final perimetro = controller.obterPerimetro();
    final tipo = controller.obterTipo();

    return Scaffold(
      appBar: AppBar(title: const Text('Resultados do Triângulo')),
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
                      'Propriedades do Triângulo',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildResultadoItem('Tipo', tipo),
                    _buildResultadoItem('Área', area.toStringAsFixed(2)),
                    _buildResultadoItem(
                      'Perímetro',
                      perimetro.toStringAsFixed(2),
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
                backgroundColor: Colors.red, // Cor de fundo
                foregroundColor: Colors.white,
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
