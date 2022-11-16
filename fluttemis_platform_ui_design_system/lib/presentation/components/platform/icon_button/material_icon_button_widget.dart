import 'package:flutter/material.dart';

import 'platform_button_widget.dart';

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
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontSize: constraints.maxWidth / 18,
                  color: Colors.white,
                ),
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Theme.of(context).primaryColor,
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        ),
      );
}
