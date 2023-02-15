import 'package:fluent_ui/fluent_ui.dart';

import 'platform_icon_button_widget.dart';

class WindowsIconButtonWidget extends PlatformIconButtonWidget {
  const WindowsIconButtonWidget({
    required super.icon,
    required super.label,
    required super.fontSize,
    required super.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Button(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: ButtonState.all(
            const RoundedRectangleBorder(),
          ),
          border: ButtonState.resolveWith(
            (states) {
              if (states.isHovering || states.isFocused) {
                return const BorderSide(
                  color: Color(0XFF3B76D6),
                  width: 2,
                );
              }

              return const BorderSide(
                color: Color(0XFF3B76D6),
              );
            },
          ),
          backgroundColor: ButtonState.resolveWith(
            (states) {
              if (states.isHovering || states.isFocused) {
                return const Color.fromARGB(255, 196, 222, 255);
              }

              return const Color.fromARGB(255, 235, 235, 235);
            },
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 11),
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          ],
        ),
      );
}
