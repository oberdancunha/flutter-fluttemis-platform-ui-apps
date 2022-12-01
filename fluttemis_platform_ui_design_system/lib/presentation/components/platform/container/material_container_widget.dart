import 'package:flutter/material.dart';

import 'platform_container_widget.dart';

class MaterialContainerWidget extends PlatformContainerWidget {
  const MaterialContainerWidget({
    required super.child,
    super.height,
    super.width,
    super.borderColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: height ?? 0,
        width: width ?? 0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: borderColor ?? const Color(0x00000000),
          ),
        ),
        child: child,
      );
}
