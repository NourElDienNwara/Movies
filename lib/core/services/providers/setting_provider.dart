import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  ThemeMode themeMode = .light;
  String? languageCode;

  void changeTheme(ThemeMode theme) {
    if (themeMode == theme) return;
    themeMode = theme;
    notifyListeners();
  }

  bool get isDark => themeMode == .dark;

  void changeLanguage(String language) {
    if (languageCode == language) return;
    languageCode = language;
    notifyListeners();
  }
}
