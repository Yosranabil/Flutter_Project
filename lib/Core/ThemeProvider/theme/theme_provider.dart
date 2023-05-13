import 'package:flutter/material.dart';
class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.dark;
  bool get isDarkMode => themeMode== ThemeMode.dark;
}
class MyTheme{

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(),
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(),
  );
}