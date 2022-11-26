import 'package:flutter/material.dart';

import 'platform_circular_image_widget.dart';

class MaterialCircularImageWidget extends PlatformCircularImageWidget {
  const MaterialCircularImageWidget({
    required super.imageWidget,
    required super.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) => CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        radius: width / 2,
        child: imageWidget,
      );
}
