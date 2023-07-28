import 'package:flutter/material.dart';

class AppProvider extends ChangeNotifier {
  ThemeMode currentThem = ThemeMode.dark;
  String currentLanguage = 'en';
  String newLang = '';

  bool isDark() {
    return currentThem == ThemeMode.dark;
  }

  void changeTheme(ThemeMode newTheme) {
    if (newTheme == currentThem) return;
    currentThem = newTheme;
    notifyListeners();
  }

  void changeLanguage(String newLang) {
    if (newLang == currentLanguage) return;
    currentLanguage = newLang;
    notifyListeners();
  }

  void refreshApp() {
    notifyListeners();
  }
}
