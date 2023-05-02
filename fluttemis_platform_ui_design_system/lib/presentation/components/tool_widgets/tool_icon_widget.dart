import 'package:flutter/widgets.dart';

import '../platform/circular_image/platform_circular_image_widget.dart';
import '../platform/color/platform_color.dart';

class ToolIconWidget extends StatelessWidget {
  final String image;
  final double width;
  final int? imageColor;

  const ToolIconWidget({
    required this.image,
    required this.width,
    this.imageColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PlatformCircularImageWidget(
        width: width / 3,
        imageWidget: Image.asset(
          image,
          fit: BoxFit.contain,
          width: width / 5,
          color: getPlatformColor(imageColor ?? 0XFFFFFFFF),
        ),
      );
}
