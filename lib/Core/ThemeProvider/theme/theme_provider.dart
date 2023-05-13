import 'package:flutter/material.dart';
class ThemeProvider extends ChangeNotifier{
  ThemeMode themeMode = ThemeMode.system;
  bool get isDarkMode => themeMode== ThemeMode.dark;

  void toggleTheme(bool isOn){
    themeMode= isOn ? ThemeMode.dark:ThemeMode.light;
    notifyListeners();
  }
}
class MyTheme{

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
    ),
    fontFamily: "Acme",
  );
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    fontFamily: "Acme",
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.black,
    ),
  );
}