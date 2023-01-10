import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_icon.dart';
import 'platform_icon_widget.dart';

class MacosIconWidget extends PlatformIconWidget {
  const MacosIconWidget({
    required super.iconType,
    required super.size,
    super.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MacosIcon(
        getPlatformIcon(iconType),
        size: size,
        color: color,
      );
}
