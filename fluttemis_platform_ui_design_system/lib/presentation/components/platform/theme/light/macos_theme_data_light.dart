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
        isAlwaysShown: true,
        thickness: 0,
        hoveringThickness: 0,
        crossAxisMargin: 0,
        mainAxisMargin: 0,
        showTrackOnHover: true,
        interactive: true,
      ),
      typography: MacosTypography(
        color: MacosColors.black,
        caption1: const TextStyle(
          color: MacosColor(0xFF323130),
        ),
      ),
      dividerColor: MacosColors.textBackgroundColor,
    );
