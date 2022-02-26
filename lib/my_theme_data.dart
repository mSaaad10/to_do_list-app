import 'package:flutter/material.dart';

class MyThemeData {
  static const lightBackgroundColor = Color.fromARGB(255, 223, 236, 219);
  static const darkBackgroundColor = Color.fromARGB(255, 6, 14, 30);

  static late final ThemeData lightTheme = ThemeData(
      accentColor: Colors.white,
      scaffoldBackgroundColor: lightBackgroundColor,
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        headline2: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        subtitle1: TextStyle(
            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
      ));
  static late final ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: darkBackgroundColor,
      accentColor: Color.fromARGB(255, 20, 25, 34),
      textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 93, 156, 236),
            fontWeight: FontWeight.bold),
        headline2: TextStyle(
            fontSize: 25,
            color: Color.fromARGB(255, 93, 156, 236),
            fontWeight: FontWeight.bold),
        subtitle1: TextStyle(
            fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
      ));
}
