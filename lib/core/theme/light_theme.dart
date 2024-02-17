import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(color: Colors.white),
    colorScheme: ColorScheme.light(
      background: Colors.grey[300]!,
      primary: Colors.grey[50]!,
      secondary: Colors.grey,
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
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ));

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
    fontSize: 30,
    fontWeight: FontWeight.w400,
  ),
  bodyMedium: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  ),
);
