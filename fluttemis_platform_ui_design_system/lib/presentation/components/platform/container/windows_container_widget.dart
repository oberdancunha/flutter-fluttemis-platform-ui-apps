import 'package:fluent_ui/fluent_ui.dart';

import 'container_type.dart';
import 'platform_container_widget.dart';

class WindowsContainerWidget extends PlatformContainerWidget {
  const WindowsContainerWidget({
    required super.child,
    super.height,
    super.width,
    super.backgroundColor,
    super.shadowColor,
    super.containerType,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: height ?? 0,
        width: width ?? 0,
        decoration: BoxDecoration(
          color: backgroundColor ?? getContainerBackgroundColor(context),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: shadowColor ?? const Color(0x00000000),
              blurRadius: 4,
            ),
          ],
        ),
        child: child,
      );

  @override
  Color getContainerBackgroundColor(BuildContext context) {
    switch (containerType) {
      case ContainerType.error:
        return FluentTheme.of(context).shadowColor.withOpacity(0.1);
      case null:
        return FluentTheme.of(context).accentColor;
    }
  }
}
