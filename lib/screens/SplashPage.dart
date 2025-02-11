import 'package:flutter/material.dart';
import 'package:flutter_app/navigation/routes.dart';

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
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, Routes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface, // Fondo dinámico
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Spacer(),
            Hero(
              tag: 'appLogo',
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png',
                height: 100,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 40), // Espaciado entre el logo y el texto
            const Text(
              'All is a widget',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
