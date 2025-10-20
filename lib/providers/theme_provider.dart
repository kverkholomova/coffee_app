import 'package:flutter/material.dart';

import '../core/theme/dark_theme.dart';
import '../core/theme/light_theme.dart';

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