import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_container_color.dart';

class DefaultContainerColor extends PlatformContainerColor {
  const DefaultContainerColor();

  @override
  Color getMacosStyle(BuildContext context) => MacosTheme.of(context).primaryColor;

  @override
  Color getWindowsStyle(BuildContext context) => FluentTheme.of(context).accentColor;

  @override
  Color getMaterialStyle(BuildContext context) => Theme.of(context).primaryColor;
}
