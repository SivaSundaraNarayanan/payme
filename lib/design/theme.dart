import 'package:flutter/material.dart';
import 'package:payme/design/color.dart';

class AppTheme {
  static ThemeData get data {
    return ThemeData(
      primaryColor: primaryBlue,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.black87,
          backgroundColor: primaryYellow,
        ),
      ),
    );
  }
}
