import 'package:flutter/material.dart';

final themeLigth = ThemeData(
  primarySwatch: Colors.deepPurple,
  primaryColor: Colors.deepPurple,
  //primaryColorBrightness: Brightness.light,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.deepPurple,
  ),
);

final themeDark = ThemeData(
  brightness: Brightness.dark,
  primarySwatch: Colors.deepPurple,
  primaryColor: Colors.deepPurple,
  primaryColorBrightness: Brightness.dark,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.deepPurple,
  ),
);
