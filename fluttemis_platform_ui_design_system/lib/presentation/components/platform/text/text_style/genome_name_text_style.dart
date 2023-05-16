import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_text_style.dart';

class GenomeNameTextStyle extends PlatformTextStyle {
  @override
  TextStyle getMacosStyle(BuildContext context) =>
      MacosTheme.of(context).typography.title2.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          );

  @override
  TextStyle getWindowsStyle(BuildContext context) =>
      fluent_ui.FluentTheme.of(context).typography.subtitle!.copyWith(
            fontStyle: FontStyle.italic,
          );

  @override
  TextStyle getMaterialStyle(BuildContext context) =>
      material.Theme.of(context).textTheme.titleLarge!.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
          );
}
