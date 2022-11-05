import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../theme/light/macos_theme_data_light.dart';
import 'platform_app_widget.dart';

class MacosAppWidget extends PlatformAppWidget {
  const MacosAppWidget({
    required super.title,
    required super.debugShowCheckedModeBanner,
    required super.routeInformationParser,
    required super.routerDelegate,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MacosApp.router(
        title: title,
        theme: macosThemeDataLight,
        themeMode:
            macosThemeDataLight.brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        routeInformationParser: routeInformationParser,
        routerDelegate: routerDelegate,
      );
}
