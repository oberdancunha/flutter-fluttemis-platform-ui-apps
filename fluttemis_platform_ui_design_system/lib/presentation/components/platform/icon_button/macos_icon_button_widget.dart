import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_icon_button_widget.dart';

class MacosIconButtonWidget extends PlatformIconButtonWidget {
  const MacosIconButtonWidget({
    required super.icon,
    required super.label,
    required super.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) => PushButton(
          onPressed: onPressed,
          buttonSize: ButtonSize.small,
          color: MacosTheme.of(context).pushButtonTheme.color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(width: constraints.maxWidth / 15),
              Text(
                label,
                style: MacosTheme.of(context).typography.title3.copyWith(
                      fontSize: constraints.maxWidth / 18,
                      color: MacosColors.white,
                    ),
              ),
            ],
          ),
        ),
      );
}
