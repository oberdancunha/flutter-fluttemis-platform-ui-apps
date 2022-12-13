import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_circular_image_widget.dart';

class MacosCircularImageWidget extends PlatformCircularImageWidget {
  const MacosCircularImageWidget({
    required super.imageWidget,
    required super.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MacosCircleAvatar(
        radius: width,
        backgroundColor: MacosTheme.of(context).primaryColor,
        child: Center(
          child: imageWidget,
        ),
      );
}

class MacosCircleAvatar extends StatelessWidget {
  final Color backgroundColor;
  final double radius;
  final Widget child;

  const MacosCircleAvatar({
    required this.backgroundColor,
    required this.radius,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => AnimatedContainer(
        constraints: BoxConstraints(
          minHeight: radius,
          minWidth: radius,
          maxHeight: radius,
          maxWidth: radius,
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        duration: const Duration(milliseconds: 200),
        child: child,
      );
}
