import 'package:fluent_ui/fluent_ui.dart';

import '../../tool_widgets/tool_icon_widget.dart';
import 'platform_tool_icon_widget.dart';

class WindowsToolIconWidget extends PlatformToolIconWidget {
  const WindowsToolIconWidget({
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
