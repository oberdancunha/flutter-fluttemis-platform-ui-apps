import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../close_dialog_button/close_dialog_by_esc_message_widget.dart';
import '../close_dialog_button/macos_close_dialog_button_widget.dart';
import 'platform_dialog_widget.dart';

class MacosDialogWidget extends PlatformDialogWidget {
  const MacosDialogWidget({
    required super.child,
    super.height,
    super.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) {
          EdgeInsets effectivePadding = calculateArea(context);
          if (width != null && height != null) {
            final horizontal = (constraints.maxWidth - width!) / 2 - 5;
            final vertical = (constraints.maxHeight - height!) / 2;
            final EdgeInsets insetPadding = EdgeInsets.symmetric(
              horizontal: horizontal,
              vertical: vertical,
            );
            effectivePadding = MediaQuery.of(context).viewInsets + insetPadding;
          }

          return MacosSheet(
            backgroundColor: MacosTheme.of(context).canvasColor,
            insetPadding: effectivePadding,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: Stack(
                    alignment: Alignment.center,
                    children: const [
                      MacosCloseDialogButtonWidget(),
                      CloseDialogByEscMessageWidget(),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: child,
                  ),
                ),
              ],
            ),
          );
        },
      );
}
