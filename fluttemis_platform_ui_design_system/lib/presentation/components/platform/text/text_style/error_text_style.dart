import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_text_style.dart';

class ErrorTextStyle extends PlatformTextStyle {
  @override
  TextStyle getMacosStyle(BuildContext context) =>
      MacosTheme.of(context).typography.title3.copyWith(
            color: MacosColors.appleRed,
          );

  @override
  TextStyle getWindowsStyle(BuildContext context) =>
      fluent_ui.FluentTheme.of(context).typography.body!.copyWith(
            color: fluent_ui.Colors.red,
          );

  @override
  TextStyle getMaterialStyle(BuildContext context) =>
      material.Theme.of(context).textTheme.displaySmall!.copyWith(
            color: material.Theme.of(context).errorColor,
          );
}
