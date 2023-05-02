import 'package:flutter/widgets.dart';

import '../platform/tooltip/platform_tooltip_widget.dart';
import 'tool_icon_widget.dart';

class ToolIconActionWidget extends StatelessWidget {
  final String image;
  final double width;
  final String message;
  final VoidCallback toolAction;

  const ToolIconActionWidget({
    required this.image,
    required this.width,
    required this.message,
    required this.toolAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PlatformTooltipWidget(
        message: message,
        child: GestureDetector(
          onTap: toolAction,
          child: ToolIconWidget(
            image: image,
            width: width,
          ),
        ),
      );
}
