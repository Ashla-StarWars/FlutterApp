import 'package:flutter/material.dart';
import 'package:flutter_app/navigation/app_routes.dart';
import 'package:flutter_app/navigation/routes.dart';
import 'package:flutter_app/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app/providers/locale_provider.dart';
import 'package:provider/provider.dart';

const Map<String, String> internationalizationSettings = {
  'en': 'en_US',
  'es': 'es_ES',
  'ca': 'ca_ES',
};

const String defaultLocale = 'en';
const String defaultLanguage = 'en_US';

void main() {
  Intl.defaultLocale = internationalizationSettings[defaultLocale];
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            locale: localeProvider.locale,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('es', 'ES'),
              Locale('ca', 'ES'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: lightMode,
            darkTheme: darkMode,
            debugShowCheckedModeBanner: false,
            routes: appRoutes,
            initialRoute: Routes.splash,
          );
        },
      ),
    );
  }
}