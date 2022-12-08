import 'package:macos_ui/macos_ui.dart';

final macosThemeDataLight = MacosThemeData.light().copyWith(
  primaryColor: const MacosColor.fromRGBO(156, 39, 176, 1),
  canvasColor: MacosColors.white,
  pushButtonTheme: const PushButtonThemeData(
    color: MacosColors.appleBlue,
  ),
);
