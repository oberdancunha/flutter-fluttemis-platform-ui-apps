import 'package:fluent_ui/fluent_ui.dart';

final windowsThemeDataLight = ThemeData.light().copyWith(
  scaffoldBackgroundColor: const Color.fromARGB(255, 241, 241, 241),
  accentColor: Colors.magenta,
  cardColor: Colors.white,
  shadowColor: Colors.grey,
  buttonTheme: ButtonThemeData(
    defaultButtonStyle: ButtonStyle(
      border: ButtonState.all(
        const BorderSide(
          width: 1.3,
          color: Color.fromARGB(255, 0, 62, 246),
        ),
      ),
      foregroundColor: ButtonState.all(Colors.grey),
    ),
  ),
);
