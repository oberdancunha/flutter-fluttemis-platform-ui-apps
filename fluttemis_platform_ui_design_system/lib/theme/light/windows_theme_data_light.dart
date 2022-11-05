import 'package:fluent_ui/fluent_ui.dart';

final windowsThemeDataLight = ThemeData().copyWith(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  accentColor: Colors.purple,
  activeColor: const Color.fromARGB(255, 132, 96, 194),
  navigationPaneTheme: const NavigationPaneThemeData(
    backgroundColor: Color(0xFFB3B0AD),
  ),
);
