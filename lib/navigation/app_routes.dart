import 'package:flutter/material.dart';
import 'package:flutter_app/navigation/routes.dart';
import 'package:flutter_app/screens/CityDetailPage.dart';
import 'package:flutter_app/screens/HomePage.dart';
import 'package:flutter_app/screens/LoginPage.dart';
import 'package:flutter_app/screens/SplashPage.dart';

Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.splash: (context) => const SplashPage(),
    Routes.login: (context) => LoginPage(),
    Routes.home: (context) {
      final username = ModalRoute.of(context)!.settings.arguments as String;
      return HomePage(username: username);
    },
    Routes.city: (context) {
      final city =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;
      return CityDetailPage(city: city);
    }
  };
}
