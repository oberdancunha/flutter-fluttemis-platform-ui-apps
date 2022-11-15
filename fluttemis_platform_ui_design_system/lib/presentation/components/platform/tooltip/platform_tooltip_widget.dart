import 'package:flutter/src/widgets/framework.dart';

import '../core/platform_widget.dart';
import 'macos_tooltip_widget.dart';
import 'material_tooltip_widget.dart';
import 'windows_tooltip_widget.dart';

class PlatformTooltipWidget
    extends PlatformWidget<MacosTooltipWidget, WindowsTooltipWidget, MaterialTooltipWidget> {
  final String message;
  final Widget child;

  const PlatformTooltipWidget({
    required this.message,
    required this.child,
    super.key,
  });

  @override
  MacosTooltipWidget buildMacosWidget() => MacosTooltipWidget(
        message: message,
        child: child,
      );

  @override
  WindowsTooltipWidget buildWindowsWidget() => WindowsTooltipWidget(
        message: message,
        child: child,
      );

  @override
  MaterialTooltipWidget buildMaterialWidget() => MaterialTooltipWidget(
        message: message,
        child: child,
      );
}
