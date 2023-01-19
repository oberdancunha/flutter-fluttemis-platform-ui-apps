import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/material.dart';

import '../tooltip/material_tooltip_widget.dart';

class MaterialCloseDialogButtonWidget extends StatelessWidget {
  const MaterialCloseDialogButtonWidget({super.key});

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.bottomLeft,
        child: SizedBox(
          height: 50,
          width: 100,
          child: MaterialTooltipWidget(
            message: FluttemisAppLocalizations.of(context)!.closeWindow,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Theme.of(context).primaryColor,
                ),
                shape: MaterialStateProperty.all(
                  const CircleBorder(),
                ),
              ),
              child: const Icon(Icons.close),
            ),
          ),
        ),
      );
}
