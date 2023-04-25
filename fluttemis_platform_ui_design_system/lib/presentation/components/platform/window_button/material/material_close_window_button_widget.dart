import 'package:flutter/material.dart';

import 'material_window_button_widget.dart';

class MaterialCloseWindowButtonWidget extends StatelessWidget {
  final String message;
  final VoidCallback onPressed;

  const MaterialCloseWindowButtonWidget({
    required this.message,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialWindowButtonWidget(
        icon: Icons.close,
        message: message,
        backgroundColor: Theme.of(context).colorScheme.errorContainer,
        onPressed: onPressed,
      );
}
