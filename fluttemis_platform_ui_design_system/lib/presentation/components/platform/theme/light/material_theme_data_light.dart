import 'package:flutter/material.dart';

final materialThemeDataLight = ThemeData.light().copyWith(
  primaryColor: const Color.fromRGBO(156, 39, 176, 1),
  backgroundColor: const Color.fromARGB(255, 241, 241, 241),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.blue.shade800),
    ),
  ),
  useMaterial3: true,
);
