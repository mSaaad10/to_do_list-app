import 'package:flutter/material.dart';
import 'package:to_do_list_route/Datebase/Models/FirebaseUtils.dart';
import 'package:to_do_list_route/Datebase/Models/Todo.dart';

class ListProvider extends ChangeNotifier {
  List<Todo> items = [];

  void refreshTodo() {
    getTodosRefWithConverters().get().then((documentsSnapshot) {
      documentsSnapshot.docs.map((document) {
        return document.data();
      }).toList();
      notifyListeners();
    });
  }
}
