import 'package:flutter/material.dart';
import '../controller/parallelogram-controller.dart';
import '../view/parallelogram_result.dart';

class ParallelogramEntry extends StatefulWidget {
  const ParallelogramEntry({super.key});

  @override
  _ParallelogramEntryState createState() => _ParallelogramEntryState();
}

class _ParallelogramEntryState extends State<ParallelogramEntry> {
  final _formKey = GlobalKey<FormState>();
  final _baseController = TextEditingController();
  final _heightController = TextEditingController();
  final ParallelogramController _controller = ParallelogramController();

  @override
  void dispose() {
    _baseController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      final base = double.parse(_baseController.text);
      final height = double.parse(_heightController.text);

      _controller.setDimensions(base, height);

      if (!_controller.isValid()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Valores inválidos! Todos devem ser maiores que zero.',
            ),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ParallelogramResult(controller: _controller),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de Paralelogramo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _baseController,
                decoration: const InputDecoration(
                  labelText: 'Base',
                  border: OutlineInputBorder(),
                  suffixText: 'unidades',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Digite a base';
                  final val = double.tryParse(value);
                  if (val == null) return 'Valor inválido';
                  if (val <= 0) return 'Deve ser > 0';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _heightController,
                decoration: const InputDecoration(
                  labelText: 'Altura',
                  border: OutlineInputBorder(),
                  suffixText: 'unidades',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Digite a altura';
                  final val = double.tryParse(value);
                  if (val == null) return 'Valor inválido';
                  if (val <= 0) return 'Deve ser > 0';
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
