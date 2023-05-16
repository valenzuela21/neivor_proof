import "package:flutter/material.dart";

abstract class AppTheme {
  static const Color primaryColor = Color(0xff6741a1);
  static const Color secondaryColor = Colors.grey;
  static const Color threeColor = Color(0xff8158c0);

  static ThemeData theme(BuildContext context) => Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: AppTheme.primaryColor,
              secondary: AppTheme.secondaryColor,
              tertiary: AppTheme.threeColor,
            ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 14, color: Colors.black38),
          bodyMedium: TextStyle(fontSize: 12, color: Colors.black38),
          bodySmall: TextStyle(fontSize: 10, color: Colors.black38),
          displayLarge: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black54),
          displayMedium: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black54),
          displaySmall: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),
          headlineMedium: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black54),
          headlineSmall: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black54),
          titleLarge: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
          titleMedium: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black54),
          titleSmall: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black54),
        ),
      );
}
