import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

MacosThemeData get macosThemeDataLight => MacosThemeData(
      brightness: Brightness.light,
      primaryColor: const MacosColor.fromRGBO(156, 39, 176, 1),
      canvasColor: MacosColors.white,
      pushButtonTheme: const PushButtonThemeData(
        color: MacosColors.systemBlueColor,
        secondaryColor: MacosColors.white,
      ),
      iconTheme: const MacosIconThemeData(
        color: MacosColors.black,
      ),
      scrollbarTheme: const MacosScrollbarThemeData().copyWith(
        radius: const Radius.elliptical(2, 2),
        isAlwaysShown: true,
        thickness: 5,
        hoveringThickness: 5,
        crossAxisMargin: 0,
        mainAxisMargin: 0,
      ),
      typography: MacosTypography(
        color: MacosColors.black,
        caption1: const TextStyle(
          color: MacosColor(0xFF323130),
        ),
      ),
      dividerColor: MacosColors.textBackgroundColor,
    );
