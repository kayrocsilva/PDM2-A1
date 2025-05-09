import 'package:flutter/material.dart';
import '../controller/cube-controller.dart';
import '../view/cube_result.dart';

class CubeEntry extends StatefulWidget {
  const CubeEntry({super.key});

  @override
  _CubeEntryState createState() => _CubeEntryState();
}

class _CubeEntryState extends State<CubeEntry> {
  final _formKey = GlobalKey<FormState>();
  final _sideController = TextEditingController();
  final CubeController _controller = CubeController();

  @override
  void dispose() {
    _sideController.dispose();
    super.dispose();
  }

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      final side = double.parse(_sideController.text);
      _controller.setSide(side);

      if (!_controller.isValid()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Valor inválido! O lado deve ser maior que zero.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CubeResult(controller: _controller),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de Cubo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _sideController,
                decoration: const InputDecoration(
                  labelText: 'Lado do cubo',
                  border: OutlineInputBorder(),
                  suffixText: 'unidades',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite o valor do lado';
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
