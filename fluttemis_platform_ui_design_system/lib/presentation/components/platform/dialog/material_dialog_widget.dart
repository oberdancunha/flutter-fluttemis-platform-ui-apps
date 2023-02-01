import 'package:flutter/material.dart';

import '../close_dialog_button/close_dialog_by_esc_message_widget.dart';
import '../close_dialog_button/material_close_dialog_button_widget.dart';
import 'platform_dialog_widget.dart';

class MaterialDialogWidget extends PlatformDialogWidget {
  const MaterialDialogWidget({
    required super.child,
    super.height,
    super.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Dialog(
        insetPadding: calculateArea(context),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: height ?? MediaQuery.of(context).size.height,
            maxWidth: width ?? MediaQuery.of(context).size.width,
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Stack(
              children: [
                const CloseDialogByEscMessageWidget(),
                child,
                const MaterialCloseDialogButtonWidget(),
              ],
            ),
          ),
        ),
      );
}
