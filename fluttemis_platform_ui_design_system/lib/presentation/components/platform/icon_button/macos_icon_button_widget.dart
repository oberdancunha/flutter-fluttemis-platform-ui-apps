import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_icon_button_widget.dart';

class MacosIconButtonWidget extends PlatformIconButtonWidget {
  const MacosIconButtonWidget({
    required super.icon,
    required super.label,
    required super.fontSize,
    required super.onPressed,
    super.softWrap,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MacosTheme(
        data: MacosThemeData(
          iconTheme: MacosIconThemeData(
            color: MacosTheme.of(context).pushButtonTheme.secondaryColor,
          ),
        ),
        child: PushButton(
          onPressed: onPressed,
          buttonSize: ButtonSize.small,
          color: MacosTheme.of(context).pushButtonTheme.color,
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
        ),
      );
}
