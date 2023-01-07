import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

Future<T?> platformShowDialog<T>({
  required BuildContext context,
  required WidgetBuilder builder,
}) {
  const barrierDismissible = true;

  if (Platform.isIOS) {
    return showCupertinoDialog(
      context: context,
      builder: builder,
      barrierDismissible: barrierDismissible,
    );
  } else if (Platform.isMacOS) {
    return showMacosSheet(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: builder,
    );
  }

  return showDialog(
    context: context,
    builder: builder,
    barrierDismissible: barrierDismissible,
  );
}
