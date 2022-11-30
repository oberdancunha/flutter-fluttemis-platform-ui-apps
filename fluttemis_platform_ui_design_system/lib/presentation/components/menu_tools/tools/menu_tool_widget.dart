import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../../platform/tool_card/platform_tool_card_widget.dart';

class MenuToolWidget extends StatelessWidget {
  const MenuToolWidget({super.key});

  @override
  Widget build(BuildContext context) => PlatformToolCardWidget(
        image: 'assets/images/menu.png',
        mainTitle: 'Menu',
        secondaryTitle: FluttemisAppLocalizations.of(context)!.backTo,
        toolActionButtonDescription: FluttemisAppLocalizations.of(context)!.goToMenu,
        toolAction: () {
          Modular.to.popAndPushNamed('/');
        },
      );
}
