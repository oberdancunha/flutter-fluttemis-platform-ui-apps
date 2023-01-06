import 'package:flutter/material.dart';

import 'icon_type_enum.dart';
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
        getIconData(),
        size: size,
        color: color,
      );

  @override
  IconData? getIconData() {
    switch (iconType) {
      case IconType.openFile:
        return Icons.file_open;
      case IconType.menu:
        return Icons.grid_view;
      case IconType.recovery:
        return Icons.loop;
      case IconType.table:
        return Icons.table_chart;
    }
  }
}
