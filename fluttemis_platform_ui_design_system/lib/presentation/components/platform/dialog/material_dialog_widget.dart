import 'package:flutter/material.dart';

import '../close_dialog_button/close_dialog_by_esc_message_widget.dart';
import '../close_dialog_button/material_close_dialog_button_widget.dart';
import 'platform_dialog_widget.dart';

class MaterialDialogWidget extends PlatformDialogWidget {
  const MaterialDialogWidget({
    required super.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Dialog(
        insetPadding: calculateArea(context),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 40,
                child: Stack(
                  alignment: Alignment.center,
                  children: const [
                    CloseDialogByEscMessageWidget(),
                    MaterialCloseDialogButtonWidget(),
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
        ),
      );
}
