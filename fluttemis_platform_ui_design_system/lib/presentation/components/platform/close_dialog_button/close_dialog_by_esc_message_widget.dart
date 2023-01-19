import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../text/platform_text_widget.dart';
import '../text/text_type_enum.dart';

class CloseDialogByEscMessageWidget extends StatelessWidget {
  const CloseDialogByEscMessageWidget({super.key});

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.topCenter,
        child: PlatformTextWidget(
          FluttemisAppLocalizations.of(context)!.escToCloseWindow,
          textType: TextType.caption,
          fontSize: 13,
        ),
      );
}
