import 'package:flutter/widgets.dart';

import '../core/platform_widget.dart';
import 'macos_scaffold_widget.dart';
import 'material_scaffold_widget.dart';
import 'windows_scaffold_widget.dart';

class PlatformScaffoldWidget
    extends PlatformWidget<MacosScaffoldWidget, WindowsScaffoldWidget, MaterialScaffoldWidget> {
  final Widget body;

  const PlatformScaffoldWidget({
    required this.body,
    super.key,
  });

  @override
  MacosScaffoldWidget buildMacosWidget() => MacosScaffoldWidget(
        body: body,
      );

  @override
  WindowsScaffoldWidget buildWindowsWidget() => WindowsScaffoldWidget(
        body: body,
      );

  @override
  MaterialScaffoldWidget buildMaterialWidget() => MaterialScaffoldWidget(
        body: body,
      );
}
