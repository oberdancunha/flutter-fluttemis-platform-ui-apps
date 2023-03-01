import 'package:flutter/widgets.dart';

import '../core/platform_widget.dart';
import 'macos_dialog_widget.dart';
import 'material_dialog_widget.dart';
import 'windows_dialog_widget.dart';

class PlatformDialogWidget
    extends PlatformWidget<MacosDialogWidget, WindowsDialogWidget, MaterialDialogWidget> {
  final Widget child;

  const PlatformDialogWidget({
    required this.child,
    super.key,
  });

  @override
  MacosDialogWidget buildMacosWidget() => MacosDialogWidget(child: child);

  @override
  WindowsDialogWidget buildWindowsWidget() => WindowsDialogWidget(child: child);

  @override
  MaterialDialogWidget buildMaterialWidget() => MaterialDialogWidget(child: child);

  EdgeInsets calculateArea(BuildContext context) {
    const EdgeInsets insetPadding = EdgeInsets.symmetric(horizontal: 38, vertical: 48);
    final EdgeInsets effectivePadding = MediaQuery.of(context).viewInsets + insetPadding;

    return effectivePadding;
  }
}
