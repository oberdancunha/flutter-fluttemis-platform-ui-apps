import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_dialog_widget.dart';

class MacosDialogWidget extends PlatformDialogWidget {
  const MacosDialogWidget({
    required super.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MacosSheet(child: child);
}
