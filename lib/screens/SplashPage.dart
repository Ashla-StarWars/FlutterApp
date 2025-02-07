import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Retraso de 2 segundos antes de navegar a la pantalla de login
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/loginpage');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface, // Cambia el fondo según tu diseño
      body: Center(
        child: Hero(
          tag: 'appLogo',
          child: Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png',
            fit: BoxFit.cover, color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
