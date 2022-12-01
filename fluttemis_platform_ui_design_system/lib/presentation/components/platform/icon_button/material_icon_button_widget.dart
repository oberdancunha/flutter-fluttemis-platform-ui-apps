import 'package:flutter/material.dart';

import 'platform_icon_button_widget.dart';

class MaterialIconButtonWidget extends PlatformIconButtonWidget {
  const MaterialIconButtonWidget({
    required super.icon,
    required super.label,
    required super.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) => ElevatedButton.icon(
          onPressed: onPressed,
          icon: icon,
          label: Text(
            label,
            style: Theme.of(context).textTheme.button!.copyWith(
                  fontSize: constraints.maxWidth / 21.2,
                  color: Colors.white,
                ),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      );
}
