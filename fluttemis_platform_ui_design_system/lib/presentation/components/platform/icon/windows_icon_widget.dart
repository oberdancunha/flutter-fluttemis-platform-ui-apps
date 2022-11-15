import 'package:fluent_ui/fluent_ui.dart';

import 'platform_icon_widget.dart';

class WindowsIconWidget extends PlatformIconWidget {
  const WindowsIconWidget(
    super.iconData, {
    required super.size,
    required super.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Icon(
        iconData,
        size: size,
        color: color,
      );
}
