import 'package:flutter/widgets.dart';

import '../core/platform_widget.dart';
import 'container_type.dart';
import 'macos_container_widget.dart';
import 'material_container_widget.dart';
import 'windows_container_widget.dart';

class PlatformContainerWidget
    extends PlatformWidget<MacosContainerWidget, WindowsContainerWidget, MaterialContainerWidget> {
  final Widget child;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? shadowColor;
  final Color? borderColor;
  final ContainerType? containerType;

  const PlatformContainerWidget({
    required this.child,
    this.height,
    this.width,
    this.backgroundColor,
    this.shadowColor,
    this.borderColor,
    this.containerType,
    super.key,
  });

  @override
  MacosContainerWidget buildMacosWidget() => MacosContainerWidget(
        height: height,
        width: width,
        backgroundColor: backgroundColor,
        shadowColor: shadowColor,
        containerType: containerType,
        child: child,
      );

  @override
  WindowsContainerWidget buildWindowsWidget() => WindowsContainerWidget(
        height: height,
        width: width,
        backgroundColor: backgroundColor,
        shadowColor: shadowColor,
        containerType: containerType,
        child: child,
      );

  @override
  MaterialContainerWidget buildMaterialWidget() => MaterialContainerWidget(
        height: height,
        width: width,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        containerType: containerType,
        child: child,
      );

  Color getContainerBackgroundColor(BuildContext context) => const Color(0x00000000);
}
