import 'package:flutter/material.dart';
import 'package:prova/view/rectangle_entry.dart';
import 'package:prova/view/square_entry.dart';
import '../view/triangle_entry.dart';
import '../view/hexagon_entry.dart';
import '../view/diamond_entry.dart';
import '../view/circle_entry.dart';
import '../view/parallelogram_entry.dart';
import '../view/trapeze_entry.dart';
import '../view/sphere_entry.dart';
import '../view/cube_entry.dart';

// Importe o arquivo com as páginas

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // Lista de botões com suas respectivas páginas
  final List<Map<String, dynamic>> menuButtons = [
    {
      'title': 'Retangulo',
      'icon': Icons.home,
      'color': Colors.blue,
      'page': const RectangleEntry(),
    },
    {
      'title': 'Triangle',
      'icon': Icons.settings,
      'color': Colors.green,
      'page': const TriangleEntry(),
    },
    {
      'title': 'Hexagono',
      'icon': Icons.person,
      'color': Colors.purple,
      'page': const HexagonEntry(),
    },
    {
      'title': 'Losango',
      'icon': Icons.notifications,
      'color': Colors.orange,
      'page': const DiamondEntry(),
    },

    {
      'title': 'Quadrado',
      'icon': Icons.email,
      'color': Colors.red,
      'page': const SquareEntry(),
    },
    {
      'title': 'Circulo',
      'icon': Icons.favorite,
      'color': Colors.pink,
      'page': const CircleEntry(),
    },
    {
      'title': 'Paralelograma',
      'icon': Icons.shopping_cart,
      'color': Colors.teal,
      'page': ParallelogramEntry(),
    },
    {
      'title': 'Trapézio',
      'icon': Icons.map,
      'color': Colors.indigo,
      'page': const TrapezeEntry(),
    },
    {
      'title': 'Esfera',
      'icon': Icons.music_note,
      'color': Colors.amber,
      'page': const SphereEntry(),
    },
    {
      'title': 'Cubo',
      'icon': Icons.camera_alt,
      'color': Colors.cyan,
      'page': const CubeEntry(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(title: const Text("Menu Principal"), centerTitle: true),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.2,
        ),
        itemCount: menuButtons.length,
        itemBuilder: (context, index) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: menuButtons[index]['color'],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => menuButtons[index]['page'],
                ),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(menuButtons[index]['icon'], size: 40, color: Colors.white),
                const SizedBox(height: 8),
                Text(
                  menuButtons[index]['title'],
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
