import 'package:flutter/material.dart';
import '../controller/sphere-controller.dart';
import '../view/sphere_result.dart';

class SphereEntry extends StatefulWidget {
  const SphereEntry({super.key});

  @override
  _SphereEntryState createState() => _SphereEntryState();
}

class _SphereEntryState extends State<SphereEntry> {
  final _formKey = GlobalKey<FormState>();
  final _diameterController = TextEditingController();
  final SphereController _controller = SphereController();

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
          builder: (context) => SphereResult(controller: _controller),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de Esfera')),
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
