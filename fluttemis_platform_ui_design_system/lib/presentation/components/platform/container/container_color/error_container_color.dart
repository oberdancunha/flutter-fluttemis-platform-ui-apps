import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../theme/fluttemis_material_theme_extension.dart';
import 'platform_container_color.dart';

class ErrorContainerColor extends PlatformContainerColor {
  const ErrorContainerColor(super.context);

  @override
  Color getMacosStyle() => MacosTheme.of(context).brightness == Brightness.light
      ? MacosColors.windowFrameColor
      : MacosColors.alternatingContentBackgroundColor;

  @override
  Color getWindowsStyle() => FluentTheme.of(context).shadowColor.withOpacity(0.1);

  @override
  Color getMaterialStyle() {
    final materialThemeExtension = Theme.of(context).extension<FluttemisMaterialThemeExtension>()!;

    return materialThemeExtension.errorBackgroundColor;
  }
}
