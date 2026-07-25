import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    _loadTheme();
  }

  void _loadTheme() {
    final themeIndex = SpUtil.getInt('theme_mode', defValue: 0);
    _themeMode = ThemeMode.values[themeIndex!];
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    if (_themeMode != mode) {
      _themeMode = mode;
      SpUtil.putInt('theme_mode', mode.index);
      notifyListeners();
    }
  }
}
