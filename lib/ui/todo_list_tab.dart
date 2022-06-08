import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do_list_route/providers/ListPovider.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  late ListProvider listProvider;

  @override
  void initState() {
    // listProvider = Provider.of<ListProvider>(context, listen: false);
    Future.delayed(Duration(milliseconds: 500), () {
      listProvider.refreshTodo();
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of(context);

    return Container(
      child: Column(
        children: [
          TableCalendar(
            selectedDayPredicate: (day) {
              return isSameDay(listProvider.selectedDay, day);
            },
            onDaySelected: (sDay, fDay) {
              listProvider.setNewSelectedDay(sDay);
              listProvider.focusedDay = fDay;
              Future.delayed(Duration(milliseconds: 500), () {
                listProvider.refreshTodo();
              });
            },
            weekendDays: [],
            calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8)),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                    color: Colors.grey, borderRadius: BorderRadius.circular(8)),
                todayTextStyle: TextStyle(color: Colors.white),
                defaultDecoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                defaultTextStyle: TextStyle(color: Colors.black)),
            calendarFormat: CalendarFormat.week,
            focusedDay: listProvider.focusedDay,
            firstDay: DateTime.now().subtract(Duration(days: 365)),
            lastDay: DateTime.now().add(Duration(days: 365)),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (buildContext, index) {
              return TodoItem(listProvider.items[index]);
            },
            itemCount: listProvider.items.length,
          )),
        ],
      ),
    );
  }
}