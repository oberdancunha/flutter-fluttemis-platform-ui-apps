import 'package:flutter/widgets.dart';

import '../core/platform_widget.dart';
import 'macos_icon_button_widget.dart';
import 'material_icon_button_widget.dart';
import 'windows_icon_button_widget.dart';

class PlatformIconButtonWidget extends PlatformWidget<MacosIconButtonWidget,
    WindowsIconButtonWidget, MaterialIconButtonWidget> {
  final Widget icon;
  final String label;
  final double fontSize;
  final VoidCallback onPressed;
  final bool? softWrap;

  const PlatformIconButtonWidget({
    required this.icon,
    required this.label,
    required this.fontSize,
    required this.onPressed,
    this.softWrap = false,
    super.key,
  });

  @override
  MacosIconButtonWidget buildMacosWidget() => MacosIconButtonWidget(
        icon: icon,
        label: label,
        fontSize: fontSize,
        onPressed: onPressed,
        softWrap: softWrap,
      );

  @override
  WindowsIconButtonWidget buildWindowsWidget() => WindowsIconButtonWidget(
        icon: icon,
        label: label,
        fontSize: fontSize,
        onPressed: onPressed,
        softWrap: softWrap,
      );

  @override
  MaterialIconButtonWidget buildMaterialWidget() => MaterialIconButtonWidget(
        icon: icon,
        label: label,
        fontSize: fontSize,
        onPressed: onPressed,
        softWrap: softWrap,
      );
}
