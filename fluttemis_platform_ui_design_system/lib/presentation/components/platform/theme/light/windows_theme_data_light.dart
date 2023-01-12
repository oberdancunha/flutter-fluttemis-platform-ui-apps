import 'package:fluent_ui/fluent_ui.dart';

final windowsThemeDataLight = ThemeData.light().copyWith(
  scaffoldBackgroundColor: const Color.fromARGB(255, 241, 241, 241),
  accentColor: Colors.magenta,
  cardColor: Colors.white,
  shadowColor: const Color.fromARGB(255, 104, 104, 104),
  borderInputColor: const Color.fromARGB(255, 111, 111, 111),
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
  iconTheme: const IconThemeData(),
  scrollbarTheme: const ScrollbarThemeData(
    radius: Radius.zero,
    hoveringRadius: Radius.zero,
    thickness: 5,
    hoveringThickness: 5,
    hoveringPadding: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    hoveringCrossAxisMargin: 0,
    crossAxisMargin: 0,
    hoveringMainAxisMargin: 0,
    mainAxisMargin: 0,
  ),
  dialogTheme: const ContentDialogThemeData(
    decoration: BoxDecoration(
      color: Colors.white,
    ),
  ),
);
