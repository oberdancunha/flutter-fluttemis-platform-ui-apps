import 'package:fluent_ui/fluent_ui.dart' as fluent_ui;
import 'package:flutter/material.dart' as material;
import 'package:flutter/widgets.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_text_style.dart';

class CaptionTextStyle extends PlatformTextStyle {
  const CaptionTextStyle(super.context);

  @override
  TextStyle getMacosStyle() => MacosTheme.of(context).typography.caption1.copyWith(
        color: MacosColors.systemGrayColor,
      );

  @override
  TextStyle getWindowsStyle() => fluent_ui.FluentTheme.of(context).typography.caption!.copyWith(
        color: fluent_ui.Colors.grey[90],
      );

  @override
  TextStyle getMaterialStyle() => material.Theme.of(context).textTheme.caption!.copyWith(
        color: material.Colors.grey.shade500,
      );
}
