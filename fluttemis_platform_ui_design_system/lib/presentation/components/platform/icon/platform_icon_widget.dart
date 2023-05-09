import 'package:flutter/widgets.dart';

import '../core/platform_widget.dart';
import 'icon_data/platform_icon_data.dart';
import 'macos_icon_widget.dart';
import 'material_icon_widget.dart';
import 'windows_icon_widget.dart';

class PlatformIconWidget
    extends PlatformWidget<MacosIconWidget, WindowsIconWidget, MaterialIconWidget> {
  final PlatformIconData iconData;
  final double size;
  final Color? color;

  const PlatformIconWidget({
    required this.iconData,
    required this.size,
    this.color,
    super.key,
  });

  @override
  MacosIconWidget buildMacosWidget() => MacosIconWidget(
        iconData: iconData,
        size: size,
        color: color,
      );

  @override
  WindowsIconWidget buildWindowsWidget() => WindowsIconWidget(
        iconData: iconData,
        size: size,
        color: color,
      );

  @override
  MaterialIconWidget buildMaterialWidget() => MaterialIconWidget(
        iconData: iconData,
        size: size,
        color: color,
      );
}
