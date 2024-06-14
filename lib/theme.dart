import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  dividerColor: Colors.transparent,
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white, scrolledUnderElevation: 0),
  listTileTheme: const ListTileThemeData(tileColor: Colors.white),
  useMaterial3: true,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      textStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 16)),
      foregroundColor: MaterialStateProperty.resolveWith(
          (states) => const Color.fromARGB(255, 89, 131, 94)),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith(
          (states) => const Color(0xFF4B5D4D)),
      foregroundColor:
          MaterialStateProperty.resolveWith((states) => Colors.white),
    ),
  ),
);

BoxDecoration getDecoration() {
  return BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.19),
        spreadRadius: 0.0,
        blurRadius: 5,
        offset: const Offset(0, 0),
      ),
    ],
  );
}
