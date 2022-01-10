import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  late String title;
  late String description;
  late bool isDone;
  late DateTime dateTime;
  late String id;

  Todo(
      {required this.dateTime,
      required this.description,
      this.isDone = false,
      required this.title,
      String id = ''});

  Todo.fromJson(Map<String, dynamic> json) {
    Timestamp timestamp = json['dateTime'] as Timestamp;
    //id = json['id']! as String;
    title = json['title']! as String;
    description = json['description']! as String;
    isDone = json['isDone']! as bool;
    dateTime = timestamp.toDate();
  }

  Map<String, dynamic> toJson() {
    return {
      //  'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
      'dateTime': dateTime,
    };
  }
}
