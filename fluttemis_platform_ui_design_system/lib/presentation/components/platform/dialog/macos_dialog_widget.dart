import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../close_dialog_button/close_dialog_by_esc_message_widget.dart';
import '../close_dialog_button/macos_close_dialog_button_widget.dart';
import 'platform_dialog_widget.dart';

class MacosDialogWidget extends PlatformDialogWidget {
  const MacosDialogWidget({
    required super.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MacosSheet(
        backgroundColor: MacosTheme.of(context).canvasColor,
        child: Stack(
          children: [
            const MacosCloseDialogButtonWidget(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  const CloseDialogByEscMessageWidget(),
                  child,
                ],
              ),
            ),
          ],
        ),
      );
}
