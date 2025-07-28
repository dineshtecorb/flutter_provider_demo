import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  var _themeMode = ThemeMode.light;

  ThemeMode get theme => _themeMode;

  void setThemeMode(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }
}
