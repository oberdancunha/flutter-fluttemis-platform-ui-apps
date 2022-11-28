import 'package:fluent_ui/fluent_ui.dart';

import 'platform_container_widget.dart';

class WindowsContainerWidget extends PlatformContainerWidget {
  const WindowsContainerWidget({
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
          color:
              backgroundColor != null ? Color(backgroundColor!) : FluentTheme.of(context).cardColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color:
                  shadowColor != null ? Color(shadowColor!) : FluentTheme.of(context).shadowColor,
              blurRadius: 4,
            ),
          ],
        ),
        child: child,
      );
}
