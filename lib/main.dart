import 'package:flutter/material.dart';
import 'package:flutter_app/navigation/app_routes.dart';
import 'package:flutter_app/navigation/routes.dart';
import 'package:flutter_app/screens/CityDetailPage.dart';
import 'package:flutter_app/screens/HomePage.dart';
import 'package:flutter_app/screens/LoginPage.dart';
import 'package:flutter_app/screens/SplashPage.dart';
import 'package:flutter_app/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
