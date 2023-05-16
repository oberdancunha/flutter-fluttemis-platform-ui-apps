import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../core/platform_style_context.dart';

class PlatformDrawRulerColor extends PlatformStyleContext<Color> {
  PlatformDrawRulerColor();

  @override
  Color getMacosStyle(BuildContext context) => MacosTheme.of(context).dividerColor;

  @override
  Color getWindowsStyle(BuildContext context) {
    final decoration = FluentTheme.of(context).dividerTheme.decoration! as BoxDecoration;

    return decoration.color!;
  }

  @override
  Color getMaterialStyle(BuildContext context) =>
      Theme.of(context).dividerTheme.color!.basedOnLuminance();
}
