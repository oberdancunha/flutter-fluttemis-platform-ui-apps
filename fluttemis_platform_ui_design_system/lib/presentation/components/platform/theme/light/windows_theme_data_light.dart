import 'package:fluent_ui/fluent_ui.dart';

final windowsThemeDataLight = ThemeData.light().copyWith(
  scaffoldBackgroundColor: const Color.fromARGB(255, 241, 241, 241),
  accentColor: Colors.magenta,
  cardColor: Colors.white,
  shadowColor: Colors.grey,
  buttonTheme: ButtonThemeData(
    filledButtonStyle: ButtonStyle(
      backgroundColor: ButtonState.all(Colors.blue.dark),
    ),
    defaultButtonStyle: ButtonStyle(
      border: ButtonState.all(
        BorderSide(color: Colors.blue.dark),
      ),
      foregroundColor: ButtonState.all(Colors.grey),
    ),
  ),
);
