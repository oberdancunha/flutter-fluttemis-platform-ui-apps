import 'package:fluent_ui/fluent_ui.dart';

import 'platform_icon_button_widget.dart';

class WindowsIconButtonWidget extends PlatformIconButtonWidget {
  const WindowsIconButtonWidget({
    required super.icon,
    required super.label,
    required super.fontSize,
    required super.onPressed,
    super.softWrap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Button(
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
              style: TextStyle(fontSize: fontSize),
              softWrap: softWrap,
            ),
          ],
        ),
      );
}
