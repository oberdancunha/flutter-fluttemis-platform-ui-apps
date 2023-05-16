import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

import '../core/platform_style_context.dart';

class PlatformShowDialog extends PlatformStyleContext<Future<void>> {
  final WidgetBuilder builder;

  PlatformShowDialog({
    required this.builder,
  });

  static const barrierDismissible = true;

  @override
  Future<void> getMacosStyle(BuildContext context) => showMacosSheet(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: builder,
      );

  @override
  Future<void> getWindowsStyle(BuildContext context) => fluent_ui.showDialog(
        context: context,
        builder: builder,
        barrierDismissible: barrierDismissible,
      );

  @override
  Future<void> getMaterialStyle(BuildContext context) => material.showDialog(
        context: context,
        builder: builder,
        barrierDismissible: barrierDismissible,
      );
}
