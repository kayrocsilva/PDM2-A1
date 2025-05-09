import 'package:flutter/material.dart';
import '../controller/rectangle-controller.dart';
import '../view/rectangle_result.dart';

class RectangleEntry extends StatefulWidget {
  const RectangleEntry({super.key});

  @override
  _RectangleEntryState createState() => _RectangleEntryState();
}

class _RectangleEntryState extends State<RectangleEntry> {
  final _formKey = GlobalKey<FormState>();
  final _larguraController = TextEditingController();
  final _alturaController = TextEditingController();
  final RectangleController _controller = RectangleController();

  @override
  void dispose() {
    _larguraController.dispose();
    _alturaController.dispose();
    super.dispose();
  }

  void _calcular() {
    if (_formKey.currentState!.validate()) {
      final largura = double.parse(_larguraController.text);
      final altura = double.parse(_alturaController.text);

      _controller.definirDimensoes(largura, altura);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RectangleResult(controller: _controller),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cálculo de Retângulo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _larguraController,
                decoration: const InputDecoration(
                  labelText: 'Largura',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite a largura';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Valor inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _alturaController,
                decoration: const InputDecoration(
                  labelText: 'Altura',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite a altura';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Valor inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _calcular,
                child: const Text('Calcular'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo, // Cor de fundo
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
