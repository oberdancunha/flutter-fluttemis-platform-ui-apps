import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../fluttemis_theme_extension.dart';

final macosThemeDataLight = MacosThemeData().copyWith(
  brightness: Brightness.light,
  primaryColor: const MacosColor.fromARGB(255, 132, 96, 194),
  iconTheme: const MacosIconThemeData(
    color: MacosColors.black,
  ),
  iconButtonTheme: MacosIconButtonThemeData(
    hoverColor: MacosColors.systemGrayColor.darkElevatedColor,
    boxConstraints: const BoxConstraints(
      minHeight: 20,
      minWidth: 20,
      maxWidth: 33,
      maxHeight: 33,
    ),
  ),
);

FluttemisThemeExtension<MacosColor> get macosThemeDataLightExtension => FluttemisThemeExtension(
      sidebarBackgroundColor: const MacosColor(0xFFB3B0AD),
    );
