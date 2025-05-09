import 'package:flutter/material.dart';
import '../controller/triangle-controller.dart';
import '../view/triangle_result.dart';

class TriangleEntry extends StatefulWidget {
  const TriangleEntry({super.key});

  @override
  _TriangleEntryPageState createState() => _TriangleEntryPageState();
}

class _TriangleEntryPageState extends State<TriangleEntry> {
  final _formKey = GlobalKey<FormState>();
  final _ladoAController = TextEditingController();
  final _ladoBController = TextEditingController();
  final _ladoCController = TextEditingController();
  final TriangleController _controller = TriangleController();

  @override
  void dispose() {
    _ladoAController.dispose();
    _ladoBController.dispose();
    _ladoCController.dispose();
    super.dispose();
  }

  void _calcular() {
    if (_formKey.currentState!.validate()) {
      final ladoA = double.parse(_ladoAController.text);
      final ladoB = double.parse(_ladoBController.text);
      final ladoC = double.parse(_ladoCController.text);

      _controller.definirLados(ladoA, ladoB, ladoC);

      if (!_controller.ehValido()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Triângulo inválido! A soma de dois lados deve ser maior que o terceiro.',
            ),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TriangleResult(controller: _controller),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cálculo de Triângulo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _ladoAController,
                decoration: const InputDecoration(
                  labelText: 'Lado A',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite o lado A';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Valor inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _ladoBController,
                decoration: const InputDecoration(
                  labelText: 'Lado B',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite o lado B';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Valor inválido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _ladoCController,
                decoration: const InputDecoration(
                  labelText: 'Lado C',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Digite o lado C';
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
