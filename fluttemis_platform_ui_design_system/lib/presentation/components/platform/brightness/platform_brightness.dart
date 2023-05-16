import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../core/platform_style_context.dart';

class PlatformBrightness extends PlatformStyleContext<Brightness> {
  const PlatformBrightness();

  @override
  Brightness getMacosStyle(BuildContext context) => MacosTheme.of(context).brightness;

  @override
  Brightness getWindowsStyle(BuildContext context) => FluentTheme.of(context).brightness;

  @override
  Brightness getMaterialStyle(BuildContext context) => Theme.of(context).brightness;
}
