import 'package:flutter/material.dart';
import '../controller/square-controller.dart';
import 'square_result.dart';

class SquareEntry extends StatefulWidget {
  const SquareEntry({super.key});

  @override
  _SquareEntryState createState() => _SquareEntryState();
}

class _SquareEntryState extends State<SquareEntry> {
  final _formKey = GlobalKey<FormState>();
  final _sideController = TextEditingController();
  final SquareController _controller = SquareController();

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
            content: Text('Lado inválido! Deve ser maior que zero.'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SquareResult(controller: _controller),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de Quadrado')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _sideController,
                decoration: const InputDecoration(
                  labelText: 'Comprimento do lado',
                  border: OutlineInputBorder(),
                  suffixText: 'unidades',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite o comprimento do lado';
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
                child: const Text('Calcular Propriedades'),
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
