import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_text_style.dart';

class LabelTextStyle extends PlatformTextStyle {
  const LabelTextStyle(super.context);

  @override
  TextStyle getMacosStyle() => MacosTheme.of(context).typography.caption1;

  @override
  TextStyle getWindowsStyle() => fluent_ui.FluentTheme.of(context).typography.caption!;

  @override
  TextStyle getMaterialStyle() => material.Theme.of(context).textTheme.caption!;
}
