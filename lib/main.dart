import 'package:flutter/material.dart';
import 'package:flutter_app/navigation/app_routes.dart';
import 'package:flutter_app/navigation/routes.dart';
import 'package:flutter_app/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darkMode,
      routes: appRoutes,
      initialRoute: Routes.splash,
    );
  }
}
