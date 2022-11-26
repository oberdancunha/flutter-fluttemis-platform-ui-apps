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
  Widget build(BuildContext context) => SizedBox(
        width: width,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: MacosTheme.of(context).primaryColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: imageWidget,
          ),
        ),
      );
}
