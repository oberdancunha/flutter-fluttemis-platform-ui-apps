import 'package:flutter/widgets.dart';

import '../../../core/platform_widget.dart';
import 'macos_app_widget.dart';
import 'material_app_widget.dart';
import 'windows_app_widget.dart';

class PlatformAppWidget
    extends PlatformWidget<MacosAppWidget, WindowsAppWidget, MaterialAppWidget> {
  final String title;
  final bool debugShowCheckedModeBanner;
  final RouteInformationParser<Object> routeInformationParser;
  final RouterDelegate<Object> routerDelegate;

  const PlatformAppWidget({
    required this.title,
    required this.debugShowCheckedModeBanner,
    required this.routeInformationParser,
    required this.routerDelegate,
    super.key,
  });

  @override
  MacosAppWidget buildMacosWidget() => MacosAppWidget(
        title: title,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        routeInformationParser: routeInformationParser,
        routerDelegate: routerDelegate,
      );

  @override
  WindowsAppWidget buildWindowsWidget() => WindowsAppWidget(
        title: title,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        routeInformationParser: routeInformationParser,
        routerDelegate: routerDelegate,
      );

  @override
  MaterialAppWidget buildMaterialWidget() => MaterialAppWidget(
        title: title,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        routeInformationParser: routeInformationParser,
        routerDelegate: routerDelegate,
      );
}
