import 'package:flutter/material.dart';

class ColorLight {}

class ColorDark {}

class AppTheme {
  static ColorLight lightColor = ColorLight();
  static ColorDark darkColor = ColorDark();

  static ThemeData lightTheme = ThemeData(

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
  );

  static ThemeData darkTheme = ThemeData();
}
