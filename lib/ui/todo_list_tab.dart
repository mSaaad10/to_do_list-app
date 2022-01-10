import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:to_do_list_route/providers/ListPovider.dart';
import 'package:to_do_list_route/ui/to_do_item.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    ListProvider listProvider = Provider.of(context);
    listProvider.refreshTodo();
    return Container(
      child: Column(
        children: [
          TableCalendar(
            selectedDayPredicate: (day) {
              return isSameDay(selectedDay, day);
            },
            onDaySelected: (sDay, fDay) {
              setState(() {
                selectedDay = sDay;
                focusedDay = fDay;
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
            focusedDay: focusedDay,
            firstDay: DateTime.now().subtract(Duration(days: 365)),
            lastDay: DateTime.now().add(Duration(days: 365)),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (buildContext, index) {
                return TodoItem(listProvider.items[index]);
              },
              itemCount: listProvider.items.length,
            ),
          )
        ],
      ),
    );
  }
}
