import 'dart:io';

import 'package:flutter/material.dart';

abstract class PlatformWidget<MacosWidget extends Widget, WindowsWidget extends Widget,
    MaterialWidget extends Widget> extends StatelessWidget {
  const PlatformWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS || Platform.isMacOS) {
      return buildMaterialWidget();
    } else if (Platform.isWindows) {
      return buildWindowsWidget();
    }

    return buildMaterialWidget();
  }

  MacosWidget buildMacosWidget();

  WindowsWidget buildWindowsWidget();

  MaterialWidget buildMaterialWidget();
}
