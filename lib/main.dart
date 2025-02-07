import 'package:flutter/material.dart';
import 'package:flutter_app/screens/CityDetailPage.dart';
import 'package:flutter_app/screens/HomePage.dart';
import 'package:flutter_app/screens/LoginPage.dart';
import 'package:flutter_app/screens/SplashPage.dart';
import 'package:flutter_app/theme/theme.dart';
import 'package:flutter_app/utils/Constants.dart';

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
      routes: {
        'loginpage': (context) => LoginPage(),
        'homepage': (context) => HomePage(username: "username"),
        'citydetailpage': (context) => CityDetailPage(city: Constants().cities.first)
      },
    );
  }
}