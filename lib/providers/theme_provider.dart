import 'package:flutter/material.dart';

enum AppTheme {
  light,
  dark,
}

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightTheme;

  ThemeData get themeData => _themeData;

  void setTheme(AppTheme theme) {
    switch (theme) {
      case AppTheme.light:
        _themeData = lightTheme;
        break;
      case AppTheme.dark:
        _themeData = darkTheme;
        break;
    }
    notifyListeners();
  }
}