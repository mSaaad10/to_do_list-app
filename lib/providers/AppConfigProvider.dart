import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String language = 'en';
  ThemeMode mode = ThemeMode.light;

  void setNewLang(String newLang) {
    if (language == newLang) return;
    language = newLang;
    notifyListeners();
  }

  void setNewMode(ThemeMode newMode) {
    if (mode == newMode) return;
    mode = newMode;
    notifyListeners();
  }
}
