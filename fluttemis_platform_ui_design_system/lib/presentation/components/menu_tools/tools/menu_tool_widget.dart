import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../../platform/icon/icon_type_enum.dart';
import '../../platform/tool_card/platform_tool_card_widget.dart';

class MenuToolWidget extends StatelessWidget {
  const MenuToolWidget({super.key});

  @override
  Widget build(BuildContext context) => PlatformToolCardWidget(
        image: 'assets/images/menu.png',
        mainTitle: 'Menu',
        secondaryTitle: FluttemisAppLocalizations.of(context)!.backTo,
        toolActionButtonIconType: IconType.menu,
        toolActionButtonDescription: FluttemisAppLocalizations.of(context)!.goToMenu,
        description: FluttemisAppLocalizations.of(context)!.menuDescription,
        toolAction: () {
          Modular.to.popAndPushNamed('/');
        },
      );
}
