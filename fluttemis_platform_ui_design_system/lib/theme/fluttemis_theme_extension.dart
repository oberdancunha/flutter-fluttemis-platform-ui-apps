import 'package:flutter/material.dart';

class FluttemisThemeExtension<ColorExtension>
    extends ThemeExtension<FluttemisThemeExtension<ColorExtension>> {
  final ColorExtension sidebarBackgroundColor;

  FluttemisThemeExtension({
    required this.sidebarBackgroundColor,
  });

  @override
  FluttemisThemeExtension<ColorExtension> copyWith({
    ColorExtension? sidebarBackgroundColor,
  }) =>
      FluttemisThemeExtension<ColorExtension>(
        sidebarBackgroundColor: sidebarBackgroundColor ?? this.sidebarBackgroundColor,
      );

  @override
  ThemeExtension<FluttemisThemeExtension<ColorExtension>> lerp(
    ThemeExtension<FluttemisThemeExtension>? other,
    double t,
  ) {
    if (other is! FluttemisThemeExtension) {
      return this;
    }

    return FluttemisThemeExtension(
      sidebarBackgroundColor: sidebarBackgroundColor,
    );
  }
}
