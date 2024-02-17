import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.black),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.grey[900]!,
      primary: Colors.grey[800]!,
      secondary: Colors.grey[700]!,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      titleLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      headlineLarge: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w500,
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ));
