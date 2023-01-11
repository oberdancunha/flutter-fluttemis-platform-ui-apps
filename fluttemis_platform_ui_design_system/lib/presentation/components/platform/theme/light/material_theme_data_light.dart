import 'package:flutter/material.dart';

import '../fluttemis_material_theme_extension.dart';

final materialThemeDataLight = ThemeData.light().copyWith(
  primaryColor: const Color.fromRGBO(156, 39, 176, 1),
  backgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.blue.shade800),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  ),
  scrollbarTheme: const ScrollbarThemeData().copyWith(
    thumbVisibility: MaterialStateProperty.all(true),
    thickness: MaterialStateProperty.all(5),
    crossAxisMargin: 0,
    mainAxisMargin: 0,
  ),
  iconTheme: IconThemeData(
    color: Colors.blue.shade800,
  ),
  useMaterial3: true,
  extensions: <ThemeExtension<FluttemisMaterialThemeExtension>>[
    FluttemisMaterialThemeExtension(
      errorBackgroundColor: Colors.grey.shade300,
    ),
  ],
);
