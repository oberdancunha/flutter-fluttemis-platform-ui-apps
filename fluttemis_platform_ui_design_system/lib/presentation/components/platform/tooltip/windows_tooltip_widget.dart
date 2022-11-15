import 'package:fluent_ui/fluent_ui.dart';

import 'platform_tooltip_widget.dart';

class WindowsTooltipWidget extends PlatformTooltipWidget {
  const WindowsTooltipWidget({
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
