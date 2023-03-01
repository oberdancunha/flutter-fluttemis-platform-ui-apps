import 'package:flutter/widgets.dart';

import '../close_dialog_button/close_dialog_by_esc_message_widget.dart';
import '../close_dialog_button/platform_close_dialog_button_widget.dart';

class DialogBodyWidget extends StatelessWidget {
  final Widget child;

  const DialogBodyWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            height: 40,
            child: Stack(
              alignment: Alignment.center,
              children: const [
                CloseDialogByEscMessageWidget(),
                PlatformCloseDialogButtonWidget(),
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
      );
}
