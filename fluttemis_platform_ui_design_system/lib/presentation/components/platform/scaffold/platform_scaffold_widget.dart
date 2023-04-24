import 'package:flutter/widgets.dart';

import '../core/platform_widget.dart';
import 'macos_scaffold_widget.dart';
import 'material_scaffold_widget.dart';
import 'windows_scaffold_widget.dart';

class PlatformScaffoldWidget
    extends PlatformWidget<MacosScaffoldWidget, WindowsScaffoldWidget, MaterialScaffoldWidget> {
  final Widget title;
  final Widget body;

  const PlatformScaffoldWidget({
    required this.title,
    required this.body,
    super.key,
  });

  @override
  MacosScaffoldWidget buildMacosWidget() => MacosScaffoldWidget(
        title: title,
        body: body,
      );

  @override
  WindowsScaffoldWidget buildWindowsWidget() => WindowsScaffoldWidget(
        title: title,
        body: body,
      );

  @override
  MaterialScaffoldWidget buildMaterialWidget() => MaterialScaffoldWidget(
        title: title,
        body: body,
      );
}
