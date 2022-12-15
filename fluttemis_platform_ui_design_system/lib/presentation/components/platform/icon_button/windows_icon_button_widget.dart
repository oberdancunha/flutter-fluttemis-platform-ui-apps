import 'package:fluent_ui/fluent_ui.dart';

import '../../focus/focus_widget.dart';
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
  Widget build(BuildContext context) => FocusWidget(
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
              const SizedBox(width: 11),
              Text(
                label,
                style: FluentTheme.of(context).typography.body!.copyWith(
                      fontSize: fontSize,
                    ),
              ),
            ],
          ),
        ),
      );
}
