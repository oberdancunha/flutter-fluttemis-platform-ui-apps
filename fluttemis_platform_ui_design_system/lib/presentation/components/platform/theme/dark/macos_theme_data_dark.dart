import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

MacosThemeData get macosThemeDataDark => MacosThemeData(
      brightness: Brightness.dark,
      primaryColor: MacosColors.systemPurpleColor,
      pushButtonTheme: const PushButtonThemeData(
        color: MacosColors.systemBlueColor,
        secondaryColor: MacosColors.white,
      ),
      iconTheme: const MacosIconThemeData(
        color: MacosColors.white,
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
        color: MacosColors.windowFrameColor,
        caption1: const TextStyle(
          color: MacosColors.windowFrameColor,
        ),
      ),
      dividerColor: MacosColors.windowFrameColor,
    );
