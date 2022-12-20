import 'package:flutter/widgets.dart';

import '../core/platform_widget.dart';
import 'macos_scrollbar_widget.dart';
import 'material_scrollbar_widget.dart';
import 'windows_scrollbar_widget.dart';

class PlatformScrollbarWidget
    extends PlatformWidget<MacosScrollbarWidget, WindowsScrollbarWidget, MaterialScrollbarWidget> {
  final ScrollController controller;
  final Widget child;

  const PlatformScrollbarWidget({
    required this.controller,
    required this.child,
    super.key,
  });

  @override
  MacosScrollbarWidget buildMacosWidget() => MacosScrollbarWidget(
        controller: controller,
        child: child,
      );

  @override
  WindowsScrollbarWidget buildWindowsWidget() => WindowsScrollbarWidget(
        controller: controller,
        child: child,
      );

  @override
  MaterialScrollbarWidget buildMaterialWidget() => MaterialScrollbarWidget(
        controller: controller,
        child: child,
      );
}
