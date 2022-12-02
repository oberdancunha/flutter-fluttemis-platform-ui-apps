import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'icon_type_enum.dart';
import 'platform_icon_widget.dart';

class MacosIconWidget extends PlatformIconWidget {
  const MacosIconWidget({
    required super.iconType,
    required super.size,
    super.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MacosIcon(
        getIconData(),
        size: size,
        color: color,
      );

  @override
  IconData? getIconData() {
    switch (iconType) {
      case IconType.openFile:
        return CupertinoIcons.doc_text_fill;
      case IconType.menu:
        return CupertinoIcons.rectangle_grid_2x2;
      case IconType.recovery:
        return CupertinoIcons.arrow_2_circlepath;
    }
  }
}
