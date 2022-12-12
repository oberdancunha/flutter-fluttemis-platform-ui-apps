import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../tool_widgets/tool_icon_widget.dart';
import 'platform_tool_icon_widget.dart';

class MacosToolIconWidget extends PlatformToolIconWidget {
  const MacosToolIconWidget({
    required super.image,
    required super.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ToolIconWidget(
        image: image,
        imageColor: MacosColors.white,
        width: width,
      );
}
