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
        label: Text(
          label,
          style: TextStyle(fontSize: fontSize),
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
