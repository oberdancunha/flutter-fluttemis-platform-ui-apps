import 'package:flutter/material.dart';

import '../../tool_widgets/tool_icon_widget.dart';
import 'platform_tool_icon_widget.dart';

class MaterialToolIconWidget extends PlatformToolIconWidget {
  const MaterialToolIconWidget({
    required super.image,
    required super.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ToolIconWidget(
        image: image,
        imageColor: Colors.white,
        width: width,
      );
}
