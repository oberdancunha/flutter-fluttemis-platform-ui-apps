import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../core/platform_style.dart';

class PlatformBrightness extends PlatformStyle<Brightness> {
  final BuildContext context;

  PlatformBrightness(this.context);

  @override
  Brightness getMacosStyle() => MacosTheme.of(context).brightness;

  @override
  Brightness getWindowsStyle() => FluentTheme.of(context).brightness;

  @override
  Brightness getMaterialStyle() => Theme.of(context).brightness;
}
