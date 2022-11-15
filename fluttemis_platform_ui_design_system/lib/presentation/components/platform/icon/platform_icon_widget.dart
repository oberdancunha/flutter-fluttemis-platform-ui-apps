import 'package:flutter/widgets.dart';

import '../core/platform_widget.dart';
import 'macos_icon_widget.dart';
import 'material_icon_widget.dart';
import 'windows_icon_widget.dart';

class PlatformIconWidget
    extends PlatformWidget<MacosIconWidget, WindowsIconWidget, MaterialIconWidget> {
  final IconData iconData;
  final double size;
  final Color color;

  const PlatformIconWidget(
    this.iconData, {
    required this.size,
    required this.color,
    super.key,
  });

  @override
  MacosIconWidget buildMacosWidget() => MacosIconWidget(
        iconData,
        size: size,
        color: color,
      );

  @override
  WindowsIconWidget buildWindowsWidget() => WindowsIconWidget(
        iconData,
        size: size,
        color: color,
      );

  @override
  MaterialIconWidget buildMaterialWidget() => MaterialIconWidget(
        iconData,
        size: size,
        color: color,
      );
}
