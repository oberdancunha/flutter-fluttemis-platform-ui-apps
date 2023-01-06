import 'package:fluent_ui/fluent_ui.dart';

import 'icon_type_enum.dart';
import 'platform_icon_widget.dart';

class WindowsIconWidget extends PlatformIconWidget {
  const WindowsIconWidget({
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
        return FluentIcons.text_document;
      case IconType.menu:
        return FluentIcons.grid_view_medium;
      case IconType.recovery:
        return FluentIcons.sync;
      case IconType.table:
        return FluentIcons.table;
    }
  }
}
