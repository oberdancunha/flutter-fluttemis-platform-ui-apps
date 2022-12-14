import 'package:flutter/widgets.dart';

import '../core/platform_widget.dart';
import 'macos_card_widget.dart';
import 'material_card_widget.dart';
import 'windows_card_widget.dart';

class PlatformCardWidget
    extends PlatformWidget<MacosCardWidget, WindowsCardWidget, MaterialCardWidget> {
  final Widget child;

  const PlatformCardWidget({
    required this.child,
    super.key,
  });

  @override
  MacosCardWidget buildMacosWidget() => MacosCardWidget(
        child: child,
      );

  @override
  WindowsCardWidget buildWindowsWidget() => WindowsCardWidget(
        child: child,
      );

  @override
  MaterialCardWidget buildMaterialWidget() => MaterialCardWidget(
        child: child,
      );
}
