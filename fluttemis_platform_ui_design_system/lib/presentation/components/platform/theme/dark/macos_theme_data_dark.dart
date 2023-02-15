import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

MacosThemeData get macosThemeDataDark => MacosThemeData.dark().copyWith(
      primaryColor: MacosColors.systemPurpleColor,
      pushButtonTheme: const PushButtonThemeData(
        color: MacosColors.systemBlueColor,
        secondaryColor: MacosColors.white,
      ),
      iconTheme: const MacosIconThemeData(
        color: MacosColors.white,
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
        color: MacosColors.windowFrameColor,
        caption1: const TextStyle(
          color: MacosColors.windowFrameColor,
        ),
      ),
      dividerColor: MacosColors.windowFrameColor,
    );
