import 'package:flutter/material.dart';
import '../controller/circle-controller.dart';
import '../view/circle_result.dart';

class CircleEntry extends StatefulWidget {
  const CircleEntry({super.key});

  @override
  _CircleEntryState createState() => _CircleEntryState();
}

class _CircleEntryState extends State<CircleEntry> {
  final _formKey = GlobalKey<FormState>();
  final _diameterController = TextEditingController();
  final CircleController _controller = CircleController();

  @override
  void dispose() {
    _diameterController.dispose();
    super.dispose();
  }

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      final diameter = double.parse(_diameterController.text);
      _controller.setDiameter(diameter);

      if (!_controller.isValid()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Diâmetro inválido! Deve ser maior que zero.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CircleResult(controller: _controller),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de Círculo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _diameterController,
                decoration: const InputDecoration(
                  labelText: 'Diâmetro',
                  border: OutlineInputBorder(),
                  suffixText: 'unidades',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite o diâmetro';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Valor inválido';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Deve ser maior que zero';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _calculate,
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
