import 'package:ToDoList/common/services/theme_pref_service.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDark = false;
  final ThemePrefService _themeService = ThemePrefService();
  bool get isDark => _isDark;
  ThemeProvider() {
    getCurrentTheme();
  }
  getCurrentTheme() async {
    _isDark = await _themeService.getTheme();
    notifyListeners();
  }

  set isDark(bool value) {
    _isDark = value;
    _themeService.setTheme(value);
    notifyListeners();
  }
}
