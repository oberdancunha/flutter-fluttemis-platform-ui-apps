import 'package:flutter/material.dart';

import 'platform_icon_widget.dart';

class MaterialIconWidget extends PlatformIconWidget {
  const MaterialIconWidget({
    required super.iconData,
    required super.size,
    super.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Icon(
        iconData(),
        size: size,
        color: color,
      );
}
