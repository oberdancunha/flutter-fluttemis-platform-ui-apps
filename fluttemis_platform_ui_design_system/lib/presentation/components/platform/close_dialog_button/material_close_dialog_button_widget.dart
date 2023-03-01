import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/material.dart';

import '../tooltip/material_tooltip_widget.dart';

class MaterialCloseDialogButtonWidget extends StatelessWidget {
  const MaterialCloseDialogButtonWidget({super.key});

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.bottomRight,
        child: MaterialTooltipWidget(
          message: FluttemisAppLocalizations.of(context)!.closeWindow,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(10, 30),
              backgroundColor: Theme.of(context).primaryColor,
              shape: const CircleBorder(),
            ),
            child: const Icon(
              Icons.close,
              size: 15,
            ),
          ),
        ),
      );
}
