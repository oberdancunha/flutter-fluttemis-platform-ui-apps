import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

import '../core/platform_style.dart';

class PlatformShowDialog extends PlatformStyle<Future<void>> {
  final BuildContext context;
  final WidgetBuilder builder;

  PlatformShowDialog({
    required this.context,
    required this.builder,
  });

  static const barrierDismissible = true;

  @override
  Future<void> getMacosStyle() => showMacosSheet(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: builder,
      );

  @override
  Future<void> getWindowsStyle() => fluent_ui.showDialog(
        context: context,
        builder: builder,
        barrierDismissible: barrierDismissible,
      );

  @override
  Future<void> getMaterialStyle() => material.showDialog(
        context: context,
        builder: builder,
        barrierDismissible: barrierDismissible,
      );
}
