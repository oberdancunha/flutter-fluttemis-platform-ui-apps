import 'package:flutter/widgets.dart';

import '../platform/circular_image/platform_circular_image_widget.dart';

class ToolIconWidget extends StatelessWidget {
  final String image;
  final Color imageColor;
  final double width;

  const ToolIconWidget({
    required this.image,
    required this.imageColor,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PlatformCircularImageWidget(
        width: width / 3,
        imageWidget: Image.asset(
          image,
          fit: BoxFit.contain,
          width: width / 5,
          color: imageColor,
        ),
      );
}
