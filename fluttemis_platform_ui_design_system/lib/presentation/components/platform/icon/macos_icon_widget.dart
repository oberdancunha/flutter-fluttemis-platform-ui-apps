import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_icon_widget.dart';

class MacosIconWidget extends PlatformIconWidget {
  const MacosIconWidget(
    super.iconData, {
    required super.size,
    required super.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MacosIcon(
        iconData,
        size: size,
        color: color,
      );
}