import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/material.dart';

import 'platform_icon_button_widget.dart';

class MaterialIconButtonWidget extends PlatformIconButtonWidget {
  const MaterialIconButtonWidget({
    required super.icon,
    required super.label,
    required super.fontSize,
    required super.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton.icon(
        onPressed: onPressed,
        icon: icon,
        label: AutoSizeText(
          label,
          style: TextStyle(fontSize: fontSize),
          minFontSize: fontSize - 1,
        ),
        style: const ButtonStyle().copyWith(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      );
}
