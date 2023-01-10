import 'package:fluent_ui/fluent_ui.dart';

import 'platform_icon.dart';
import 'platform_icon_widget.dart';

class WindowsIconWidget extends PlatformIconWidget {
  const WindowsIconWidget({
    required super.iconType,
    required super.size,
    super.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Icon(
        getPlatformIcon(iconType),
        size: size,
        color: color,
      );
}
