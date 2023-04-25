import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/material.dart';

import '../window_button/material/material_close_window_button_widget.dart';

class MaterialCloseDialogButtonWidget extends StatelessWidget {
  const MaterialCloseDialogButtonWidget({super.key});

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: MaterialCloseWindowButtonWidget(
            message: FluttemisAppLocalizations.of(context)!.closeWindow,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      );
}
