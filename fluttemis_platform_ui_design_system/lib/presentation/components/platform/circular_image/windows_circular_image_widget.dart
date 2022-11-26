import 'package:fluent_ui/fluent_ui.dart';

import 'platform_circular_image_widget.dart';

class WindowsCircularImageWidget extends PlatformCircularImageWidget {
  const WindowsCircularImageWidget({
    required super.imageWidget,
    required super.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) => CircleAvatar(
        backgroundColor: FluentTheme.of(context).accentColor,
        radius: width / 2,
        child: imageWidget,
      );
}
