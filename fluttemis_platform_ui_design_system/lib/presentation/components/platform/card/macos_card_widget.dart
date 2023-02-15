import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../container/macos_container_widget.dart';
import 'platform_card_widget.dart';

class MacosCardWidget extends PlatformCardWidget {
  const MacosCardWidget({
    required super.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MacosContainerWidget(
        backgroundColor: MacosTheme.of(context).canvasColor,
        child: child,
      );
}
