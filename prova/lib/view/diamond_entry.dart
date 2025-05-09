import 'package:flutter/material.dart';
import '../controller/diamond-controller.dart';
import '../view/diamond_result.dart';

class DiamondEntry extends StatefulWidget {
  const DiamondEntry({super.key});

  @override
  _DiamondEntryState createState() => _DiamondEntryState();
}

class _DiamondEntryState extends State<DiamondEntry> {
  final _formKey = GlobalKey<FormState>();
  final _majorController = TextEditingController();
  final _minorController = TextEditingController();
  final DiamondController _controller = DiamondController();

  @override
  void dispose() {
    _majorController.dispose();
    _minorController.dispose();
    super.dispose();
  }

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      final major = double.parse(_majorController.text);
      final minor = double.parse(_minorController.text);

      _controller.setDimensions(major, minor);

      if (!_controller.isValid()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Dimensões inválidas! A diagonal maior deve ser maior ou igual à menor.',
            ),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DiamondResult(controller: _controller),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de Losango')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _majorController,
                decoration: const InputDecoration(
                  labelText: 'Diagonal Maior',
                  border: OutlineInputBorder(),
                  suffixText: 'unidades',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite a diagonal maior';
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
              const SizedBox(height: 20),
              TextFormField(
                controller: _minorController,
                decoration: const InputDecoration(
                  labelText: 'Diagonal Menor',
                  border: OutlineInputBorder(),
                  suffixText: 'unidades',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite a diagonal menor';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Valor inválido';
                  }
                  if (double.parse(value) <= 0) {
                    return 'Deve ser maior que zero';
                  }
                  if (_majorController.text.isNotEmpty &&
                      double.parse(value) >
                          double.parse(_majorController.text)) {
                    return 'Deve ser menor que a diagonal maior';
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
