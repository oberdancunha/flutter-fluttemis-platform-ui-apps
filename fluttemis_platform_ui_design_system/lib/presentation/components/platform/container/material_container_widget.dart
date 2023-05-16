import 'package:flutter/material.dart';

import 'container_color/default_container_color.dart';
import 'platform_container_widget.dart';

class MaterialContainerWidget extends PlatformContainerWidget {
  const MaterialContainerWidget({
    super.child,
    super.height,
    super.width,
    super.borderColor,
    super.key,
    super.backgroundColor,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: height ?? 0,
        width: width ?? 0,
        decoration: BoxDecoration(
          color: backgroundColor ?? const DefaultContainerColor()(context),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor ?? const Color(0x00000000),
          ),
        ),
        child: child,
      );
}
