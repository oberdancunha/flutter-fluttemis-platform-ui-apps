import 'package:fluent_ui/fluent_ui.dart';

import '../theme/dark/windows_theme_data_dark.dart';
import '../theme/light/windows_theme_data_light.dart';
import 'platform_app_widget.dart';

class WindowsAppWidget extends PlatformAppWidget {
  const WindowsAppWidget({
    required super.title,
    required super.debugShowCheckedModeBanner,
    required super.routeInformationParser,
    required super.routerDelegate,
    required super.localizationsDelegates,
    required super.supportedLocales,
    super.key,
  });

  @override
  Widget build(BuildContext context) => FluentApp.router(
        title: title,
        theme: windowsThemeDataLight,
        darkTheme: windowsThemeDataDark,
        debugShowCheckedModeBanner: debugShowCheckedModeBanner,
        routeInformationParser: routeInformationParser,
        routerDelegate: routerDelegate,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        color: Colors.transparent,
      );
}
