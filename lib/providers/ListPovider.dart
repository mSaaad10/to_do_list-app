import 'package:flutter/material.dart';
import 'package:to_do_list_route/Datebase/Models/FirebaseUtils.dart';
import 'package:to_do_list_route/Datebase/Models/Todo.dart';
import 'package:to_do_list_route/format_date.dart';

class ListProvider extends ChangeNotifier {
  List<Todo> items = [];

  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  Future<void> refreshTodo() {
    print('in refresh');
    return getTodosRefWithConverters()
        .where('dateTime',
            isEqualTo: selectedDay.getOnlyDateTime().millisecondsSinceEpoch)
        .get()
        .then((documentsSnapshot) {
      items = documentsSnapshot.docs.map((document) {
        return document.data();
      }).toList();
      notifyListeners();
    });
    print(items.length);
  }

  Future<void> deleteUser(String id) async {
    getTodosRefWithConverters()
        .doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
    refreshTodo();
    notifyListeners();
  }

  setNewSelectedDay(DateTime selectedDay) {
    this.selectedDay = selectedDay;
    notifyListeners();
  }
}