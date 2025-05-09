import 'package:flutter/material.dart';
import '../controller/square-controller.dart';

class SquareResult extends StatelessWidget {
  final SquareController controller;

  const SquareResult({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final area = controller.getArea();
    final perimeter = controller.getPerimeter();
    final diagonal = controller.getDiagonal();

    return Scaffold(
      appBar: AppBar(title: const Text('Propriedades do Quadrado')),
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
                      'Propriedades do Quadrado',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildResultItem(
                      'Área',
                      '${area.toStringAsFixed(2)} unidades²',
                    ),
                    _buildResultItem(
                      'Perímetro',
                      '${perimeter.toStringAsFixed(2)} unidades',
                    ),
                    _buildResultItem(
                      'Diagonal',
                      '${diagonal.toStringAsFixed(2)} unidades',
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
