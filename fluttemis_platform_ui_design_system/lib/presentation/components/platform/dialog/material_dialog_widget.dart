import 'package:flutter/material.dart';

import 'dialog_body_widget.dart';
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
          child: DialogBodyWidget(child: child),
        ),
      );
}
