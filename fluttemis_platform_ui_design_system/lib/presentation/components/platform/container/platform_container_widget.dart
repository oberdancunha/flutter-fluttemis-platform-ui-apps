import 'package:flutter/widgets.dart';

import '../core/platform_widget.dart';
import 'macos_container_widget.dart';
import 'material_container_widget.dart';
import 'windows_container_widget.dart';

class PlatformContainerWidget
    extends PlatformWidget<MacosContainerWidget, WindowsContainerWidget, MaterialContainerWidget> {
  final Widget? child;
  final double? height;
  final double? width;
  final Color? shadowColor;
  final Color? borderColor;
  final Color? backgroundColor;

  const PlatformContainerWidget({
    this.child,
    this.height,
    this.width,
    this.shadowColor,
    this.borderColor,
    this.backgroundColor,
    super.key,
  });

  @override
  MacosContainerWidget buildMacosWidget() => MacosContainerWidget(
        height: height,
        width: width,
        backgroundColor: backgroundColor,
        child: child,
      );

  @override
  WindowsContainerWidget buildWindowsWidget() => WindowsContainerWidget(
        height: height,
        width: width,
        shadowColor: shadowColor,
        backgroundColor: backgroundColor,
        child: child,
      );

  @override
  MaterialContainerWidget buildMaterialWidget() => MaterialContainerWidget(
        height: height,
        width: width,
        borderColor: borderColor,
        backgroundColor: backgroundColor,
        child: child,
      );
}
