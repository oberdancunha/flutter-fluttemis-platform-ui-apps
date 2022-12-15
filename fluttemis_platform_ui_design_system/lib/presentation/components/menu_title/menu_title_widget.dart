import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';

class MenuTitleWidget extends StatelessWidget {
  const MenuTitleWidget({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 50,
        child: Center(
          child: PlatformTextWidget(
            FluttemisAppLocalizations.of(context)!.mainMenu,
            textType: TextType.mainTitle,
            fontSize: 30,
          ),
        ),
      );
}
