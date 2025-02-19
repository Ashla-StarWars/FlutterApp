import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_local.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = window.locale; // Obtiene el idioma del dispositivo

  Locale get locale => _locale;

  void setLocale(Locale newLocale) {
    if (!AppLocalizations.supportedLocales.contains(newLocale)) return;
    _locale = newLocale;
    notifyListeners();
  }

  void clearLocale() {
    _locale = window.locale; // Restablece al idioma del dispositivo
    notifyListeners();
  }
}