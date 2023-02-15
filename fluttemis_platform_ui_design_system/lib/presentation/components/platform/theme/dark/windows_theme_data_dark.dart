import 'package:fluent_ui/fluent_ui.dart';

ThemeData get windowsThemeDataDark => ThemeData(
      brightness: Brightness.dark,
      fontFamily: 'Segoe UI',
      scaffoldBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
      accentColor: Colors.purple,
      shadowColor: const Color.fromARGB(0, 183, 183, 183),
      borderInputColor: const Color.fromARGB(255, 111, 111, 111),
      buttonTheme: ButtonThemeData(
        defaultButtonStyle: ButtonStyle(
          border: ButtonState.all(
            const BorderSide(
              width: 0.7,
              color: Color.fromARGB(255, 0, 62, 246),
            ),
          ),
          foregroundColor: ButtonState.all(Colors.grey),
        ),
      ),
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
      typography: const Typography.raw(
        caption: TextStyle(
          color: Colors.white,
        ),
      ),
      dividerTheme: const DividerThemeData(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
    );
