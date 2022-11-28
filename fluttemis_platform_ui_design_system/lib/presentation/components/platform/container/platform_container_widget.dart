import 'package:flutter/widgets.dart';

import '../core/platform_widget.dart';
import 'macos_container_widget.dart';
import 'material_container_widget.dart';
import 'windows_container_widget.dart';

class PlatformContainerWidget
    extends PlatformWidget<MacosContainerWidget, WindowsContainerWidget, MaterialContainerWidget> {
  final Widget child;
  final double? height;
  final double? width;
  final int? backgroundColor;
  final int? shadowColor;
  final int? borderColor;

  const PlatformContainerWidget({
    required this.child,
    this.height,
    this.width,
    this.backgroundColor,
    this.shadowColor,
    this.borderColor,
    super.key,
  });

  @override
  MacosContainerWidget buildMacosWidget() => MacosContainerWidget(
        height: height,
        width: width,
        backgroundColor: backgroundColor,
        shadowColor: shadowColor,
        child: child,
      );

  @override
  WindowsContainerWidget buildWindowsWidget() => WindowsContainerWidget(
        height: height,
        width: width,
        backgroundColor: backgroundColor,
        shadowColor: shadowColor,
        child: child,
      );

  @override
  MaterialContainerWidget buildMaterialWidget() => MaterialContainerWidget(
        height: height,
        width: width,
        borderColor: borderColor,
        child: child,
      );
}
