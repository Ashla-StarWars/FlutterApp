import 'package:flutter/material.dart';
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
      home: SplashPage(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/loginpage':
            return MaterialPageRoute(builder: (context) => LoginPage());

          case '/homepage':
            final username = settings.arguments as String;
            return MaterialPageRoute(builder: (context) => HomePage(username: username));

          case '/citydetailpage':
            final city = settings.arguments as Map<String, String>;
            return MaterialPageRoute(builder: (context) => CityDetailPage(city));

          default:
            return MaterialPageRoute(builder: (context) => SplashPage());
        }
      },
    );
  }
}
