import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_tooltip_widget.dart';

class MacosTooltipWidget extends PlatformTooltipWidget {
  const MacosTooltipWidget({
    required super.message,
    required super.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MacosTooltip(
        message: message,
        useMousePosition: false,
        child: child,
      );
}
