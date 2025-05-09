import 'package:flutter/material.dart';
import '../controller/sphere-controller.dart';

class SphereResult extends StatelessWidget {
  final SphereController controller;

  const SphereResult({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resultados da Esfera')),
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
                      'Propriedades da Esfera',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildResultItem(
                      'Raio',
                      '${controller.getRadius().toStringAsFixed(2)} unidades',
                    ),
                    _buildResultItem(
                      'Área de Superfície',
                      '${controller.getSurfaceArea().toStringAsFixed(2)} unidades²',
                    ),
                    _buildResultItem(
                      'Volume',
                      '${controller.getVolume().toStringAsFixed(2)} unidades³',
                    ),
                    const SizedBox(height: 10),
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
