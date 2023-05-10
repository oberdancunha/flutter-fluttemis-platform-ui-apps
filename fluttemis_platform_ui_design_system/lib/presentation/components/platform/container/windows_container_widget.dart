import 'package:fluent_ui/fluent_ui.dart';

import 'container_color/default_container_color.dart';
import 'platform_container_widget.dart';

class WindowsContainerWidget extends PlatformContainerWidget {
  const WindowsContainerWidget({
    super.child,
    super.height,
    super.width,
    super.shadowColor,
    super.borderColor,
    super.backgroundColor,
    super.key,
  });

  @override
  @override
  Widget build(BuildContext context) => Container(
        height: height ?? 0,
        width: width ?? 0,
        decoration: BoxDecoration(
          color: backgroundColor ?? DefaultContainerColor(context)(),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: shadowColor ?? const Color(0x00000000),
              blurRadius: 4,
            ),
          ],
          border: Border.all(
            color: borderColor ?? const Color(0x00000000),
          ),
        ),
        child: child,
      );
}
