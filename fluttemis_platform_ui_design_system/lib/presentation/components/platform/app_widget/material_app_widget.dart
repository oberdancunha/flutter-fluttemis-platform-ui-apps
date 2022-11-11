import 'package:flutter/material.dart';

import '../theme/light/material_theme_data_light.dart';
import 'platform_app_widget.dart';

class MaterialAppWidget extends PlatformAppWidget {
  const MaterialAppWidget({
    required super.title,
    required super.debugShowCheckedModeBanner,
    required super.routeInformationParser,
    required super.routerDelegate,
    required super.localizationsDelegates,
    required super.supportedLocales,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: title,
        theme: materialThemeDataLight,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        routeInformationParser: routeInformationParser,
        routerDelegate: routerDelegate,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
      );
}
