import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_route/Datebase/Models/FirebaseUtils.dart';
import 'package:to_do_list_route/Datebase/Models/Todo.dart';
import 'package:to_do_list_route/providers/ListPovider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  _AddTaskBottomSheetState createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  String title = '';
  String description = '';
  bool isDone = false;
  DateTime dateTime = DateTime.now();
  late CollectionReference todosRef;

  @override
  void initState() {
    todosRef =
        FirebaseFirestore.instance.collection('movies').withConverter<Todo>(
              fromFirestore: (snapshot, _) => Todo.fromJson(snapshot.data()!),
              toFirestore: (todo, _) => todo.toJson(),
            );
    // TODO: implement initState
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ListProvider listProvider = Provider.of(context);

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).accentColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 500,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('AddTodo', style: Theme.of(context).textTheme.subtitle1),
              TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Enter a valid Title';
                  }
                },
                onChanged: (text) {
                  title = text;
                },
                decoration: InputDecoration(
                  labelStyle: Theme.of(context).textTheme.subtitle1,
                  labelText: 'Title',
                ),
              ),
              TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Enter a Description Title';
                  }
                },
                onChanged: (text) {
                  description = text;
                },
                decoration: InputDecoration(labelText: 'description'),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Date',
                ),
              ),
              InkWell(
                onTap: () {
                  showDateDialoge();
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    dateTime.toString(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    addTodo();
                    listProvider.refreshTodo();
                  },
                  child: Text('Add'))
            ],
          ),
        ),
      ),
    );
  }

  void addTodo() {
    if (!formKey.currentState!.validate()) return;
    Todo todo =
        Todo(dateTime: dateTime, description: description, title: title);
    DocumentReference doc = getTodosRefWithConverters().doc();
    todo.id = doc.id;
    doc.set(todo);
    Navigator.pop(context);
  }

  void showDateDialoge() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365)))
        .then((date) {
      if (date != null) {
        this.dateTime = date;
        setState(() {});
      }
    });
  }
}
