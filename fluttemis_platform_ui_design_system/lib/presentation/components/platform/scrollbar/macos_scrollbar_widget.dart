import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_scrollbar_widget.dart';

class MacosScrollbarWidget extends PlatformScrollbarWidget {
  const MacosScrollbarWidget({
    required super.controller,
    required super.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final macosScrollbarTheme = MacosTheme.of(context).scrollbarTheme;

    return MacosScrollbar(
      controller: controller,
      radius: macosScrollbarTheme.radius,
      isAlwaysShown: macosScrollbarTheme.isAlwaysShown,
      thickness: macosScrollbarTheme.thickness,
      interactive: true,
      child: Padding(
        padding: const EdgeInsets.only(right: 5, bottom: 5),
        child: child,
      ),
    );
  }
}
