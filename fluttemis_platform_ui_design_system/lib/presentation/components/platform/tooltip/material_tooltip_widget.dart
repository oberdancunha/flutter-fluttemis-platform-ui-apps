import 'package:flutter/material.dart';

import 'platform_tooltip_widget.dart';

class MaterialTooltipWidget extends PlatformTooltipWidget {
  const MaterialTooltipWidget({
    required super.message,
    required super.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Tooltip(
        message: message,
        child: child,
      );
}
