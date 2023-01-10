// ignore_for_file: no_default_cases

import 'package:flutter/material.dart';
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
    default:
      return showDialog(
        context: context,
        builder: builder,
        barrierDismissible: barrierDismissible,
      );
  }
}
