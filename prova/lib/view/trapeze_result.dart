import 'package:flutter/material.dart';
import '../controller/trapeze-controller.dart';

class TrapezeResult extends StatelessWidget {
  final TrapezeController controller;

  const TrapezeResult({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resultados do Trapézio')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Propriedades do Trapézio',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildResultItem(
                      'Área (A)',
                      '${controller.getArea().toStringAsFixed(2)} unidades²',
                    ),
                    _buildResultItem(
                      'Perímetro (P)',
                      '${controller.getPerimeter().toStringAsFixed(2)} unidades',
                    ),
                    _buildResultItem(
                      'Mediana (M)',
                      '${controller.getMedian().toStringAsFixed(2)} unidades',
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

  Widget _buildResultItem(String label, String value) {
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
