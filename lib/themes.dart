import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: Colors.green,
      secondary: Colors.green.shade700,
      surface: Colors.white,
      onSurface: Colors.grey,
      background: Colors.grey.shade50,
      error: Colors.red.shade700,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.green),
      titleTextStyle: TextStyle(
        color: Colors.green,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.green,
      unselectedLabelColor: Colors.grey,
      indicatorColor: Colors.green,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(color: Colors.grey.shade600),
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.black87,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(
      primary: Colors.green,
      secondary: Colors.green.shade300,
      surface: Colors.grey.shade800,
      onSurface: Colors.white,
      background: Colors.grey.shade900,
      error: Colors.red.shade300,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey.shade900,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.green),
      titleTextStyle: const TextStyle(
        color: Colors.green,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: Colors.green,
      unselectedLabelColor: Colors.grey.shade400,
      indicatorColor: Colors.green,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(color: Colors.grey.shade400),
    ),
    cardTheme: CardTheme(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.grey.shade800,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Colors.grey.shade300,
      ),
    ),
  );
}