import 'dart:async';
import 'package:flutter/material.dart';
import 'package:prova/page/login.dart';

//import '../images/cps-55-anos.png';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // Faça a chama ao método initState da Classe Superior.
    super.initState();

    // Recomendação da Google para que o Timer
    // contenha uma duração de 3 segundos como padrão.
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80.0, horizontal: 5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/cps-55-anos.png'),
              const SizedBox(height: 1.0),
              Image.asset('assets/images/fatec-matao.jpg'),
              const SizedBox(height: 25.0),
              Image.asset(
                'assets/images/cst-dsm.png',
                width: 204,
                height: 70,
              ), // 60% da imagem: cst-dsm.png
              // 50% do tamanho da imagem:cst-dsm.png => width: 204, height: 70),
              const SizedBox(height: 55.0),
              const Text(
                'Loading...', // Definir um texto para o Splash.
                style: TextStyle(
                  // Definir um estilo para o texto da Splash.
                  fontSize:
                      22.0, // Fonte no tamanho: 22sp (aproximadamente 22px).
                  fontWeight: FontWeight.bold, // Fonte no estilo negrito.
                ),
              ),
              const SizedBox(
                height: 35.0,
              ), // Definir uma caixa com espaçamento no tamanho de 35dp (aprox. 35px).
              const CircularProgressIndicator(
                // Widget (Componente) circular que indica o progresso.
                // Executa animação circular infinita na cor azul.
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                // Define a espessura do widget CircularProgressIndicator com 11dp (aprox. 11px).
                strokeWidth: 11.0,
              ),
              const SizedBox(
                height: 60.0,
              ), // Definir uma caixa com espaçamento no tamanho de 35dp (aprox. 35px).
              const Text(
                'Felipe Moretti'
                '\nKayro César'
                '\nPaulo Selestrino', // Definir um texto para o Splash.
                style: TextStyle(
                  // Definir um estilo para o texto Splash.
                  fontSize:
                      22.0, // Fonte no tamanho: 22sp (aproximadamente 22px).
                  fontWeight: FontWeight.bold, // Fonte no estilo negrito.
                  fontFamily: 'Arial', // Família da Fonte: Arial.
                ),
              ),
              const Text(
                '\nVersão 1.0', // Definir um texto para o Splash.
                style: TextStyle(
                  // Definir um estilo para o texto Splash.
                  fontSize:
                      22.0, // Fonte no tamanho: 22sp (aproximadamente 22px).
                  fontWeight: FontWeight.bold, // Fonte no estilo negrito.
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
