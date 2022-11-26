import 'package:flutter/widgets.dart';

import '../core/platform_widget.dart';
import 'macos_circular_image_widget.dart';
import 'material_circular_image_widget.dart';
import 'windows_circular_image_widget.dart';

class PlatformCircularImageWidget extends PlatformWidget<MacosCircularImageWidget,
    WindowsCircularImageWidget, MaterialCircularImageWidget> {
  final Widget imageWidget;
  final double width;

  const PlatformCircularImageWidget({
    required this.imageWidget,
    required this.width,
    super.key,
  });

  @override
  MacosCircularImageWidget buildMacosWidget() => MacosCircularImageWidget(
        imageWidget: imageWidget,
        width: width,
      );

  @override
  WindowsCircularImageWidget buildWindowsWidget() => WindowsCircularImageWidget(
        imageWidget: imageWidget,
        width: width,
      );

  @override
  MaterialCircularImageWidget buildMaterialWidget() => MaterialCircularImageWidget(
        imageWidget: imageWidget,
        width: width,
      );
}
