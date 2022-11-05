import 'package:flutter/material.dart';

import '../fluttemis_theme_extension.dart';

final materialThemeDataLight = ThemeData().copyWith(
  brightness: Brightness.light,
  primaryColor: const Color.fromARGB(255, 132, 96, 194),
  hoverColor: const Color.fromARGB(255, 152, 152, 157),
  iconTheme: const IconThemeData(
    size: 15,
  ),
  extensions: <ThemeExtension<FluttemisThemeExtension<Color>>>[
    FluttemisThemeExtension(
      sidebarBackgroundColor: const Color(0xFFB3B0AD),
    ),
  ],
);
