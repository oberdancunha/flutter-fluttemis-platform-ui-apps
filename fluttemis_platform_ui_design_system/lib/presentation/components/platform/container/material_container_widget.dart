import 'package:flutter/material.dart';

import '../theme/fluttemis_material_theme_extension.dart';
import 'container_type.dart';
import 'platform_container_widget.dart';

class MaterialContainerWidget extends PlatformContainerWidget {
  const MaterialContainerWidget({
    required super.child,
    super.height,
    super.width,
    super.backgroundColor,
    super.borderColor,
    super.containerType,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: height ?? 0,
        width: width ?? 0,
        decoration: BoxDecoration(
          color: backgroundColor ?? getContainerBackgroundColor(context),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor ?? const Color(0x00000000),
          ),
        ),
        child: child,
      );

  @override
  Color getContainerBackgroundColor(BuildContext context) {
    final materialThemeExtension = Theme.of(context).extension<FluttemisMaterialThemeExtension>()!;
    switch (containerType) {
      case ContainerType.error:
        return materialThemeExtension.errorBackgroundColor;
      case null:
        return Theme.of(context).primaryColor;
    }
  }
}
