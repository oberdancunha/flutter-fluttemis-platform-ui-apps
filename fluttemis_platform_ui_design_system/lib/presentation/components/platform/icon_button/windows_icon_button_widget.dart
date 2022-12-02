import 'package:fluent_ui/fluent_ui.dart';

import '../../focus/focus_widget.dart';
import 'platform_icon_button_widget.dart';

class WindowsIconButtonWidget extends PlatformIconButtonWidget {
  const WindowsIconButtonWidget({
    required super.icon,
    required super.label,
    required super.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) => FocusWidget(
          baseColor: const Color.fromARGB(255, 194, 194, 194),
          focusColor: const Color.fromARGB(255, 196, 222, 255),
          child: Button(
            onPressed: onPressed,
            style: ButtonStyle(
              shape: ButtonState.all(
                const RoundedRectangleBorder(),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(width: constraints.maxWidth / 15),
                Text(
                  label,
                  style: FluentTheme.of(context).typography.body!.copyWith(
                        fontSize: constraints.maxWidth / 18,
                      ),
                ),
              ],
            ),
          ),
        ),
      );
}
