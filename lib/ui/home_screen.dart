import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list_route/providers/AppConfigProvider.dart';
import 'package:to_do_list_route/ui/addTask_bottom_sheet.dart';
import 'package:to_do_list_route/ui/todo_list_tab.dart';
import 'package:to_do_list_route/ui/todo_setting_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    AppConfigProvider provider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .2,
        elevation: 0,
        title: currentIndex == 0
            ? Text(AppLocalizations.of(context)!.todoapp)
            : Text(AppLocalizations.of(context)!.setting),
      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 4)),
        backgroundColor: Colors.blue,
        onPressed: () {
          showAddTodoSheet();
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
          backgroundColor: provider.mode == ThemeMode.dark
              ? Color.fromARGB(255, 20, 25, 34)
              : Colors.white,
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          elevation: 0,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.list,
                  size: 27,
                  color: provider.mode == ThemeMode.light
                      ? Colors.grey
                      : Colors.white,
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 27,
                  color: provider.mode == ThemeMode.light
                      ? Colors.grey
                      : Colors.white,
                ),
                label: ''),
          ],
        ),
      ),
      body: tabs[currentIndex],
    );
  }

  List<Widget> tabs = [TodoList(), TodoSetting()];

  void showAddTodoSheet() {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25))),
        context: context,
        builder: (buildContext) {
          return AddTaskBottomSheet();
        });
  }
}
