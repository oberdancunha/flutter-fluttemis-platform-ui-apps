import 'package:flutter/material.dart';

import '../fluttemis_material_theme_extension.dart';

const _fontFamily = 'Ubuntu';

ThemeData get materialThemeDataDark => ThemeData(
      brightness: Brightness.dark,
      fontFamily: _fontFamily,
      primaryColor: Colors.brown.shade400,
      backgroundColor: const Color.fromARGB(255, 39, 39, 39),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.deepOrange.shade200),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          textStyle: MaterialStateProperty.all(
            const TextStyle(
              color: Colors.white,
              fontFamily: _fontFamily,
            ),
          ),
        ),
      ),
      scrollbarTheme: const ScrollbarThemeData().copyWith(
        thumbVisibility: MaterialStateProperty.all(true),
        thickness: MaterialStateProperty.all(5),
        crossAxisMargin: 0,
        mainAxisMargin: 0,
        interactive: true,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      textTheme: TextTheme(
        caption: TextStyle(
          color: Colors.grey.shade300,
        ),
      ),
      dividerTheme: DividerThemeData(
        color: Colors.grey.shade700,
      ),
      dialogBackgroundColor: const Color.fromARGB(255, 39, 39, 39),
      useMaterial3: true,
      extensions: <ThemeExtension<FluttemisMaterialThemeExtension>>[
        FluttemisMaterialThemeExtension(
          errorBackgroundColor: Colors.grey.shade900,
        ),
      ],
    );
