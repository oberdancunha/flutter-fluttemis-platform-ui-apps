import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

import '../core/platform.dart';

Future<T?> platformShowDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
}) {
  const barrierDismissible = true;
  final currentPlatform = getCurrentPlatform();
  switch (currentPlatform) {
    case CurrentPlatform.isMacOS:
      return showMacosSheet(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: builder,
      );
    case CurrentPlatform.isWindows:
      return fluent_ui.showDialog(
        context: context,
        builder: builder,
        barrierDismissible: barrierDismissible,
      );
    case CurrentPlatform.isLinux:
      return material.showDialog(
        context: context,
        builder: builder,
        barrierDismissible: barrierDismissible,
      );
  }
}
