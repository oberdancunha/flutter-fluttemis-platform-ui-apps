import 'package:flutter/widgets.dart';

import '../core/platform_widget.dart';
import 'macos_icon_button_widget.dart';
import 'material_icon_button_widget.dart';
import 'windows_button_widget.dart';

class PlatformIconButtonWidget extends PlatformWidget<MacosIconButtonWidget,
    WindowsIconButtonWidget, MaterialIconButtonWidget> {
  final Widget icon;
  final String label;
  final VoidCallback onPressed;

  const PlatformIconButtonWidget({
    required this.icon,
    required this.label,
    required this.onPressed,
    super.key,
  });

  @override
  MacosIconButtonWidget buildMacosWidget() => MacosIconButtonWidget(
        icon: icon,
        label: label,
        onPressed: onPressed,
      );

  @override
  WindowsIconButtonWidget buildWindowsWidget() => WindowsIconButtonWidget(
        icon: icon,
        label: label,
        onPressed: onPressed,
      );

  @override
  MaterialIconButtonWidget buildMaterialWidget() => MaterialIconButtonWidget(
        icon: icon,
        label: label,
        onPressed: onPressed,
      );
}
