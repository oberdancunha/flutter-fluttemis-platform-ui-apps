import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../core/platform.dart';

Color platformDrawRulerColor(BuildContext context) {
  final platform = getCurrentPlatform();
  switch (platform) {
    case CurrentPlatform.isMacOS:
      return MacosTheme.of(context).dividerColor;
    case CurrentPlatform.isWindows:
      final decoration = FluentTheme.of(context).dividerTheme.decoration! as BoxDecoration;
      return decoration.color!;
    case CurrentPlatform.isLinux:
      return Theme.of(context).dividerTheme.color!.basedOnLuminance();
  }
}
