import 'package:cloud_firestore/cloud_firestore.dart';

import 'Todo.dart';

CollectionReference<Todo> getTodosRefWithConverters() {
  return FirebaseFirestore.instance
      .collection(Todo.collectionName)
      .withConverter<Todo>(
        fromFirestore: (snapshot, _) => Todo.fromJson(snapshot.data()!),
        toFirestore: (todo, _) => todo.toJson(),
      );
}

Future<void> addTodoToFireStore(
    String title, String description, DateTime dateTime) async {
  print('in fire');
  CollectionReference<Todo> collectionReference = getTodosRefWithConverters();
  DocumentReference<Todo> documentReference = collectionReference.doc();
  Todo item = Todo(
      id: documentReference.id,
      dateTime: dateTime,
      description: description,
      title: title);

  return await documentReference.set(item);
}

