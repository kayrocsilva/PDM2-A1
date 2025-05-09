import 'package:flutter/material.dart';
import '../controller/trapeze-controller.dart';
import 'trapeze_result.dart';

class TrapezeEntry extends StatefulWidget {
  const TrapezeEntry({super.key});

  @override
  _TrapezeEntryState createState() => _TrapezeEntryState();
}

class _TrapezeEntryState extends State<TrapezeEntry> {
  final _formKey = GlobalKey<FormState>();
  final _largerBaseController = TextEditingController();
  final _smallerBaseController = TextEditingController();
  final _heightController = TextEditingController();
  final TrapezeController _controller = TrapezeController();

  @override
  void dispose() {
    _largerBaseController.dispose();
    _smallerBaseController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void _calculate() {
    if (_formKey.currentState!.validate()) {
      final largerBase = double.parse(_largerBaseController.text);
      final smallerBase = double.parse(_smallerBaseController.text);
      final height = double.parse(_heightController.text);

      _controller.setDimensions(largerBase, smallerBase, height);

      if (!_controller.isValid()) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Valores inválidos! A base maior deve ser maior que a menor.',
            ),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TrapezeResult(controller: _controller),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de Trapézio')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _largerBaseController,
                decoration: const InputDecoration(
                  labelText: 'Base Maior (B)',
                  border: OutlineInputBorder(),
                  suffixText: 'unidades',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Digite a base maior';
                  final val = double.tryParse(value);
                  if (val == null) return 'Valor inválido';
                  if (val <= 0) return 'Deve ser > 0';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _smallerBaseController,
                decoration: const InputDecoration(
                  labelText: 'Base Menor (b)',
                  border: OutlineInputBorder(),
                  suffixText: 'unidades',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Digite a base menor';
                  final val = double.tryParse(value);
                  if (val == null) return 'Valor inválido';
                  if (val <= 0) return 'Deve ser > 0';
                  if (_largerBaseController.text.isNotEmpty &&
                      val >= double.parse(_largerBaseController.text)) {
                    return 'Deve ser menor que a base maior';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _heightController,
                decoration: const InputDecoration(
                  labelText: 'Altura (h)',
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
