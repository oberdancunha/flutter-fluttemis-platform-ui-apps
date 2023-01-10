import 'package:flutter/material.dart';

import 'platform_icon.dart';
import 'platform_icon_widget.dart';

class MaterialIconWidget extends PlatformIconWidget {
  const MaterialIconWidget({
    required super.iconType,
    required super.size,
    super.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Icon(
        getPlatformIcon(iconType),
        size: size,
        color: color,
      );
}
