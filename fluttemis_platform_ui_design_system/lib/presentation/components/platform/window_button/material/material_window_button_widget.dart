import 'package:flutter/material.dart';

import '../../tooltip/material_tooltip_widget.dart';

class MaterialWindowButtonWidget extends StatelessWidget {
  final IconData icon;
  final String message;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const MaterialWindowButtonWidget({
    required this.icon,
    required this.message,
    required this.backgroundColor,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialTooltipWidget(
        message: message,
        child: IconButton(
          onPressed: onPressed,
          style: IconButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: const CircleBorder(),
          ),
          icon: Icon(
            icon,
            size: 15,
            color: Colors.white,
          ),
        ),
      );
}
