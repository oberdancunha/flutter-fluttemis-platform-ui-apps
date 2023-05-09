import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

import '../core/platform_style.dart';

class PlatformColor extends PlatformStyle<Color> {
  final int color;

  PlatformColor(this.color);

  @override
  Color getMacosStyle() => MacosColor(color);

  @override
  Color getWindowsStyle() => fluent_ui.Color(color);

  @override
  Color getMaterialStyle() => material.Color(color);
}
