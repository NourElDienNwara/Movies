import 'package:flutter/material.dart';

class ColorLight {}

class ColorDark {
  Color primary = Color(0xFF121312);
  Color secondary = Color(0xFF282A28);
  Color bottom = Color(0xFFFFBB2B);
  Color white = Color(0xFFFFFFFF);
  Color acept = Color(0xFF57AA53);
  Color error = Color(0xFFE82626);
}

class AppTheme {
  static ColorLight lightColor = ColorLight();
  static ColorDark darkColor = ColorDark();

  static ThemeData lightTheme = ThemeData();

  static ThemeData darkTheme = ThemeData(

    scaffoldBackgroundColor: darkColor.primary,

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkColor.bottom,
        foregroundColor: darkColor.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: darkColor.white,
        textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          decoration: .underline,
        ),
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkColor.secondary,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),

    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: darkColor.white,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: darkColor.white,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: darkColor.white,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: darkColor.white,
      ),
    ),
  );
}
