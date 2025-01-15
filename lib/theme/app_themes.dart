import 'package:coin_gecko/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.light,
    scaffoldBackgroundColor: kcPrimaryColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: kcPrimaryColor,
      foregroundColor: kcWhite,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
      bodySmall: TextStyle(fontSize: 12, color: Colors.grey),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );

  static final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: kcDarkGreyColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: kcWhite,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
      bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
      bodySmall: TextStyle(fontSize: 12, color: Colors.grey),
      titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    ),
  );
}
