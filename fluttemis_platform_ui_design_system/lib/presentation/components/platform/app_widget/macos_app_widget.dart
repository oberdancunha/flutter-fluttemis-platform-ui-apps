import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../theme/dark/macos_theme_data_dark.dart';
import '../theme/light/macos_theme_data_light.dart';
import 'platform_app_widget.dart';

class MacosAppWidget extends PlatformAppWidget {
  const MacosAppWidget({
    required super.title,
    required super.debugShowCheckedModeBanner,
    required super.routeInformationParser,
    required super.routerDelegate,
    required super.localizationsDelegates,
    required super.supportedLocales,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MacosApp.router(
        title: title,
        theme: macosThemeDataLight,
        darkTheme: macosThemeDataDark,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        routeInformationParser: routeInformationParser,
        routerDelegate: routerDelegate,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
      );
}
