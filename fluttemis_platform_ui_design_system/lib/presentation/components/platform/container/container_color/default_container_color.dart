import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_container_color.dart';

class DefaultContainerColor extends PlatformContainerColor {
  const DefaultContainerColor(super.context);

  @override
  Color getMacosStyle() => MacosTheme.of(context).primaryColor;

  @override
  Color getWindowsStyle() => FluentTheme.of(context).accentColor;

  @override
  Color getMaterialStyle() => Theme.of(context).primaryColor;
}
