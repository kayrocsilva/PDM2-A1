import 'package:flutter/material.dart';
import '../controller/hexagon-controller.dart';
import 'hexagon_result.dart';

class HexagonEntry extends StatefulWidget {
  const HexagonEntry({super.key});

  @override
  _HexagonEntryState createState() => _HexagonEntryState();
}

class _HexagonEntryState extends State<HexagonEntry> {
  final _formKey = GlobalKey<FormState>();
  final _ladoController = TextEditingController();
  final HexagonController _controller = HexagonController();

  @override
  void dispose() {
    _ladoController.dispose();
    super.dispose();
  }

  void _calcular() {
    if (_formKey.currentState!.validate()) {
      final lado = double.parse(_ladoController.text);
      _controller.definirLado(lado);

      if (!_controller.ehValido()) {
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
          builder: (context) => HexagonResult(controller: _controller),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hexágono Regular')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _ladoController,
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
                    return 'O lado deve ser maior que zero';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _calcular,
                child: const Text('Calcular Propriedades'),
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
