// core/theme/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  static const Color colorPrimario = Color.fromRGBO(0, 121, 107, 1);

  static final light = ThemeData(
    useMaterial3: true, // Activar Material Design 3
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: colorPrimario, // Color principal
      onPrimary: Colors.white, // Texto/íconos sobre primary
      secondary: Colors.tealAccent[700]!,
      onSecondary: Colors.white,
      surface: Colors.white,
      onSurface: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: colorPrimario,
      foregroundColor: Colors.white, // Texto del AppBar
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    ),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: colorPrimario,
      onPrimary: Colors.white,
      secondary: Colors.tealAccent,
      onSecondary: Colors.black,
      surface: Colors.grey[900]!,
      onSurface: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      foregroundColor: Colors.white,
    ),
  );
}
