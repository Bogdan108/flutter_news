import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.black),
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      background: Colors.grey[900]!,
      primary: Colors.grey[800]!,
      secondary: Colors.grey[700]!,
    ),
    textTheme: textTheme);

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(color: Colors.white),
    colorScheme: ColorScheme.light(
      background: Colors.grey[300]!,
      primary: Colors.grey[50]!,
      secondary: Colors.grey,
    ),
    textTheme: textTheme);

const TextTheme textTheme = TextTheme(
  titleMedium: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  ),
  titleLarge: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
  ),
  headlineLarge: TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.w500,
  ),
  headlineSmall: TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w500,
  ),
  bodyMedium: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  ),
  bodySmall: TextStyle(
    color: Colors.blue,
    fontSize: 20,
    fontWeight: FontWeight.w500,
  ),
);
