import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_text_style.dart';

class TitleTextStyle extends PlatformTextStyle {
  const TitleTextStyle(super.context);

  @override
  TextStyle getMacosStyle() => MacosTheme.of(context).typography.title1.copyWith(
        color: MacosTheme.of(context).primaryColor,
      );

  @override
  TextStyle getWindowsStyle() => fluent_ui.FluentTheme.of(context).typography.title!.copyWith(
        color: fluent_ui.FluentTheme.of(context).accentColor,
      );

  @override
  TextStyle getMaterialStyle() => material.Theme.of(context).textTheme.titleLarge!.copyWith(
        color: material.Theme.of(context).primaryColor,
      );
}
