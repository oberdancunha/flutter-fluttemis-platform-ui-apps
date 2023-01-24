import 'package:fluent_ui/fluent_ui.dart';

import 'platform_scrollbar_widget.dart';

class WindowsScrollbarWidget extends PlatformScrollbarWidget {
  const WindowsScrollbarWidget({
    required super.controller,
    required super.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scrollbar(
        controller: controller,
        interactive: true,
        child: child,
      );
}
