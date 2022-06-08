import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_route/Datebase/Models/FirebaseUtils.dart';

import '../providers/ListPovider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  _AddTaskBottomSheetState createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  String title = '';
  String description = '';
  bool isDone = false;
  DateTime dateTime = DateTime.now();

  // void initState() {
  //
  //   getTodosRefWithConverters();
  //   // todosRef =
  //   //     FirebaseFirestore.instance.collection(Todo.collectionName).withConverter<Todo>(
  //   //           fromFirestore: (snapshot, _) => Todo.fromJson(snapshot.data()!),
  //   //           toFirestore: (todo, _) => todo.toJson(),
  //   //         );
  //   // TODO: implement initState
  //   super.initState();
  // }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ListProvider listProvider = Provider.of(context);

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 360,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Add Todo', style: Theme.of(context).textTheme.subtitle1),
              TextFormField(
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Enter a valid Title';
                  }
                  return null;
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
                  return null;
                },
                onChanged: (text) {
                  description = text;
                },
                decoration: InputDecoration(
                    labelStyle: Theme.of(context).textTheme.subtitle1,
                    labelText: 'description'),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Date',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              InkWell(
                onTap: () {
                  showDateDialoge();
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    DateFormat.yMMMEd().format(dateTime),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Theme.of(context).primaryColorDark),
                  ),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                child: ElevatedButton(
                    onPressed: () {
                      addTodo();
                      Future.delayed(Duration(milliseconds: 500), () {
                        listProvider.refreshTodo();
                      });
                      Navigator.pop(context);
                    },
                    child: Text('Add')),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addTodo() {
    if (!formKey.currentState!.validate()) return;

    addTodoToFireStore(
      title,
      description,
      dateTime,
    ).then((value) {
      print('added $dateTime');
    });
  }

  Future<void> showDateDialoge() {
    return showDatePicker(
            context: context,
            initialDate: this.dateTime,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365)))
        .then((date) {
      this.dateTime = date!;
    });
  }
}