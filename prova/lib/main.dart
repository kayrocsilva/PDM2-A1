import 'package:flutter/material.dart';
import 'package:prova/page/splash.dart';

void main() {
  runApp(const ProvaApp());
}

class ProvaApp extends StatelessWidget {
  const ProvaApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: const Splash());
  }
}
