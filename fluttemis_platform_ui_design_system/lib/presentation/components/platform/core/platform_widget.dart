import 'package:flutter/widgets.dart';

import 'platform.dart';

abstract class PlatformWidget<MacosWidget extends Widget, WindowsWidget extends Widget,
    MaterialWidget extends Widget> extends StatelessWidget {
  const PlatformWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final currentPlatform = getCurrentPlatform();
    switch (currentPlatform) {
      case CurrentPlatform.isMacOS:
        return buildMacosWidget();
      case CurrentPlatform.isWindows:
        return buildWindowsWidget();
      case CurrentPlatform.isLinux:
        return buildMaterialWidget();
    }
  }

  MacosWidget buildMacosWidget();

  WindowsWidget buildWindowsWidget();

  MaterialWidget buildMaterialWidget();
}
