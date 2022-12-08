import 'package:flutter/material.dart';

import '../fluttemis_material_theme_extension.dart';

final materialThemeDataLight = ThemeData.light().copyWith(
  primaryColor: const Color.fromRGBO(156, 39, 176, 1),
  backgroundColor: Colors.white,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.blue.shade800),
    ),
  ),
  useMaterial3: true,
  extensions: <ThemeExtension<FluttemisMaterialThemeExtension>>[
    FluttemisMaterialThemeExtension(
      errorBackgroundColor: Colors.grey.shade300,
    ),
  ],
);
