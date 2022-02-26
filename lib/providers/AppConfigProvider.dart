import 'package:flutter/material.dart';
import 'package:to_do_list_route/Datebase/Models/FirebaseUtils.dart';

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

  Future<void> deleteUser(String id) async {
    getTodosRefWithConverters()
        .doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
    notifyListeners();
  }
}
