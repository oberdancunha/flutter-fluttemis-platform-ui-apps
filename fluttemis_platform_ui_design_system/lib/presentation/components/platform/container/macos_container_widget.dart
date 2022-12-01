import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_container_widget.dart';

class MacosContainerWidget extends PlatformContainerWidget {
  const MacosContainerWidget({
    required super.child,
    super.height,
    super.width,
    super.backgroundColor,
    super.shadowColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: height ?? 0,
        width: width ?? 0,
        decoration: BoxDecoration(
          color: backgroundColor ?? MacosTheme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: shadowColor ?? const MacosColor(0x00000000),
              blurRadius: 10,
            ),
          ],
        ),
        child: child,
      );
}
