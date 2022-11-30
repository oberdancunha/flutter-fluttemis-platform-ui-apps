import 'package:flutter/widgets.dart';

import '../core/platform_widget.dart';
import 'icon_type_enum.dart';
import 'macos_icon_widget.dart';
import 'material_icon_widget.dart';
import 'windows_icon_widget.dart';

class PlatformIconWidget
    extends PlatformWidget<MacosIconWidget, WindowsIconWidget, MaterialIconWidget> {
  final IconType iconType;
  final double size;
  final Color color;

  const PlatformIconWidget({
    required this.iconType,
    required this.size,
    required this.color,
    super.key,
  });

  @override
  MacosIconWidget buildMacosWidget() => MacosIconWidget(
        iconType: iconType,
        size: size,
        color: color,
      );

  @override
  WindowsIconWidget buildWindowsWidget() => WindowsIconWidget(
        iconType: iconType,
        size: size,
        color: color,
      );

  @override
  MaterialIconWidget buildMaterialWidget() => MaterialIconWidget(
        iconType: iconType,
        size: size,
        color: color,
      );

  IconData? getIconData() => null;
}
