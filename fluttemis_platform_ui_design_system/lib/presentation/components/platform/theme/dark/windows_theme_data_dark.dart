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
          foregroundColor: ButtonState.all(Colors.white),
          border: ButtonState.resolveWith(
            (states) {
              if (states.isHovering || states.isFocused) {
                return const BorderSide(
                  color: Color(0xFFFFFFFF),
                );
              }

              return const BorderSide(
                color: Color(0xFFFFFFFF),
                width: 1.5,
              );
            },
          ),
          backgroundColor: ButtonState.resolveWith(
            (states) {
              if (states.isHovering || states.isFocused) {
                return const Color(0XFF454545);
              }

              return const Color(0XFF333333);
            },
          ),
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
      dialogTheme: const ContentDialogThemeData(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 28, 28, 28),
        ),
      ),
    );
