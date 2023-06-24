import 'package:fluent_ui/fluent_ui.dart';

ThemeData get windowsThemeDataLight => ThemeData(
      brightness: Brightness.light,
      fontFamily: 'Segoe UI',
      scaffoldBackgroundColor: const Color.fromARGB(255, 249, 249, 249),
      accentColor: Colors.magenta,
      cardColor: Colors.white,
      shadowColor: const Color.fromARGB(255, 104, 104, 104),
      borderInputColor: const Color.fromARGB(255, 111, 111, 111),
      buttonTheme: ButtonThemeData(
        defaultButtonStyle: ButtonStyle(
          foregroundColor: ButtonState.all(Colors.grey),
          border: ButtonState.resolveWith(
            (states) {
              if (states.isHovering || states.isFocused) {
                return const BorderSide(
                  color: Color(0XFF3B76D6),
                );
              }

              return const BorderSide(
                color: Color(0XFF3B76D6),
                width: 1.5,
              );
            },
          ),
          backgroundColor: ButtonState.resolveWith(
            (states) {
              if (states.isHovering || states.isFocused) {
                return const Color(0XFFE7F1FB);
              }

              return const Color.fromARGB(255, 235, 235, 235);
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
      dialogTheme: const ContentDialogThemeData(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
      typography: Typography.raw(
        caption: TextStyle(
          color: Colors.grey[160],
        ),
      ),
      dividerTheme: const DividerThemeData(
        decoration: BoxDecoration(
          color: Colors.black,
        ),
      ),
    );
