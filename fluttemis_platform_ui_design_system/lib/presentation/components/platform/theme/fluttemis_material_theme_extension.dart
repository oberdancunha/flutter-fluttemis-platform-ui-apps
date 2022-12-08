import 'package:flutter/material.dart';

class FluttemisMaterialThemeExtension extends ThemeExtension<FluttemisMaterialThemeExtension> {
  final Color errorBackgroundColor;

  FluttemisMaterialThemeExtension({
    required this.errorBackgroundColor,
  });

  @override
  ThemeExtension<FluttemisMaterialThemeExtension> copyWith({
    Color? errorBackgroundColor,
  }) =>
      FluttemisMaterialThemeExtension(
        errorBackgroundColor: errorBackgroundColor ?? this.errorBackgroundColor,
      );

  @override
  ThemeExtension<FluttemisMaterialThemeExtension> lerp(
    ThemeExtension<FluttemisMaterialThemeExtension>? other,
    double t,
  ) {
    if (other is! FluttemisMaterialThemeExtension) {
      return this;
    }

    return FluttemisMaterialThemeExtension(errorBackgroundColor: errorBackgroundColor);
  }
}
