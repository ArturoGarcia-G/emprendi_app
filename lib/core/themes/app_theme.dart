// core/theme/app_theme.dart
import 'package:emprendi_app/core/themes/color_palette.dart';
import 'package:flutter/material.dart';

class AppTheme {
  /// =========================
  /// THEME CLARO
  /// =========================
  static final light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: const ColorScheme.light(
      primary: Color.fromRGBO(0, 121, 107, 1),
      onPrimary: colorBlanco,
      secondary: colorSecundario,
      onSecondary: colorBlanco,
      surface: colorCardClaro,
      onSurface: colorNegro900,
      error: colorRojo800,
      onError: colorBlanco,
      outline: colorBordeClaro,
    ),

    dividerTheme: const DividerThemeData(color: gris, thickness: 1, space: 32),

    // Fondo general
    scaffoldBackgroundColor: colorBackgroundClaro,

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: colorBackgroundClaro,
      foregroundColor: colorNegro900,
      elevation: 0,
    ),

    // Drawer
    drawerTheme: DrawerThemeData(
      backgroundColor: colorBackgroundClaro,
      scrimColor: Colors.black.withOpacity(0.5),
    ),

    // BottomNavigationBar
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: colorBackgroundClaro,
      selectedItemColor: colorPrimario,
      unselectedItemColor: grisClaro,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),

    // Botones
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorPrimario,
        foregroundColor: colorBlanco,
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorPrimario,
        side: const BorderSide(color: colorPrimario),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: colorPrimario),
    ),

    // Tarjetas (Cards)
    cardTheme: CardThemeData(
      color: colorBackgroundClaro,
      shadowColor: Colors.black.withOpacity(0.1),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: colorBordeClaro),
      ),
      margin: EdgeInsets.zero,
    ),

    //Floating action button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: colorPrimario,
      foregroundColor: colorBlanco,
      elevation: 4,
      sizeConstraints: BoxConstraints.tightFor(width: 50, height: 50),
      shape: CircleBorder(),
    ),

    // Iconos
    iconTheme: const IconThemeData(color: colorNegro900, size: 24),

    // Texto
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: colorNegro900),
      bodyMedium: TextStyle(color: colorNegro900),
      bodySmall: TextStyle(color: colorGris600),
      titleLarge: TextStyle(color: colorNegro900, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: colorNegro900),
      labelLarge: TextStyle(color: colorPrimario),
    ),
  );

  /// =========================
  /// THEME OSCURO
  /// =========================
  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: const ColorScheme.dark(
      primary: colorSecundario,
      onPrimary: colorNegro900,
      secondary: colorPrimario,
      onSecondary: colorNegro900,
      surface: colorCardOscuro,
      onSurface: colorBlanco,
      error: colorRojo800,
      onError: colorBlanco,
      outline: colorBordeOscuro,
    ),

    dividerTheme: const DividerThemeData(color: gris, thickness: 1, space: 32),

    scaffoldBackgroundColor: colorBackgroundOscuro,

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: colorCardOscuro,
      foregroundColor: colorBlanco,
      elevation: 0,
    ),

    // Drawer
    drawerTheme: DrawerThemeData(
      backgroundColor: colorBackgroundOscuro,
      scrimColor: Colors.black.withOpacity(0.5),
    ),

    // BottomNavigationBar
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: colorCardOscuro,
      selectedItemColor: colorSecundario,
      unselectedItemColor: gris,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
    ),

    // Botones
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: colorSecundario,
        foregroundColor: colorNegro900,
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: colorSecundario,
        side: const BorderSide(color: Colors.white70),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: colorSecundario),
    ),

    // Tarjetas
    cardTheme: CardThemeData(
      color: colorCardOscuro,
      shadowColor: Colors.black.withOpacity(0.2),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: colorBordeOscuro),
      ),
      margin: EdgeInsets.zero,
    ),

    //Floating action button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: colorSecundario,
      foregroundColor: colorNegro900,
      elevation: 4,
      sizeConstraints: BoxConstraints.tightFor(width: 50, height: 50),
      shape: CircleBorder(),
    ),

    // Iconos
    iconTheme: const IconThemeData(color: colorBlanco, size: 24),

    // Texto
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: colorBlanco),
      bodyMedium: TextStyle(color: colorBlanco),
      bodySmall: TextStyle(color: colorBlanco),
      titleLarge: TextStyle(color: colorBlanco, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: colorBlanco),
      labelLarge: TextStyle(color: colorSecundario),
    ),
  );
}
