import 'package:cloud_firestore/cloud_firestore.dart';

import 'Todo.dart';

CollectionReference<Todo> getTodosRefWithConverters() {
  return FirebaseFirestore.instance.collection('todos').withConverter<Todo>(
        fromFirestore: (snapshot, _) => Todo.fromJson(snapshot.data()!),
        toFirestore: (todo, _) => todo.toJson(),
      );
}
