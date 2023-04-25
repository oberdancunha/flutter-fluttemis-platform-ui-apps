import 'package:flutter/material.dart';

import 'material_window_button_widget.dart';

class MaterialChangeWindowButtonWidget extends StatelessWidget {
  final IconData icon;
  final String message;
  final VoidCallback onPressed;

  const MaterialChangeWindowButtonWidget({
    required this.icon,
    required this.message,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialWindowButtonWidget(
        icon: icon,
        message: message,
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: onPressed,
      );
}
