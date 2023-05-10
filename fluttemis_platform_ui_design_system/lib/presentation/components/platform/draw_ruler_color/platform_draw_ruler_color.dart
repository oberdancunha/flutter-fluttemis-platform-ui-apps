import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../core/platform_style.dart';

class PlatformDrawRulerColor extends PlatformStyle<Color> {
  final BuildContext context;

  PlatformDrawRulerColor(this.context);

  @override
  Color getMacosStyle() => MacosTheme.of(context).dividerColor;

  @override
  Color getWindowsStyle() {
    final decoration = FluentTheme.of(context).dividerTheme.decoration! as BoxDecoration;

    return decoration.color!;
  }

  @override
  Color getMaterialStyle() => Theme.of(context).dividerTheme.color!.basedOnLuminance();
}
