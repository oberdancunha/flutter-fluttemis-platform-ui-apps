import 'package:flutter/material.dart';

import 'platform_dialog_widget.dart';

class MaterialDialogWidget extends PlatformDialogWidget {
  const MaterialDialogWidget({
    required super.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Dialog(
        insetPadding: calculateArea(context),
        child: child,
      );
}
