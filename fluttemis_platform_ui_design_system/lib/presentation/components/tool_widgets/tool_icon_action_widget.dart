import 'package:flutter/material.dart';

import '../platform/tooltip/platform_tooltip_widget.dart';
import 'tool_icon_widget.dart';

class ToolIconActionWidget extends StatelessWidget {
  final String image;
  final Color imageColor;
  final double width;
  final String message;
  final VoidCallback action;

  const ToolIconActionWidget({
    required this.image,
    required this.imageColor,
    required this.width,
    required this.message,
    required this.action,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PlatformTooltipWidget(
        message: message,
        child: InkWell(
          onTap: action,
          child: ToolIconWidget(
            image: image,
            imageColor: imageColor,
            width: width,
          ),
        ),
      );
}
