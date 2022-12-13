import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../../platform/icon/icon_type_enum.dart';
import 'i_template_tool.dart';

class MenuToolWidget extends ITemplateTool {
  const MenuToolWidget({
    super.key,
  });

  @override
  State<MenuToolWidget> createState() => _MenuToolWidgetState();
}

class _MenuToolWidgetState extends ITemplateToolState<MenuToolWidget> {
  @override
  String? get description => FluttemisAppLocalizations.of(context)!.menuDescription;

  @override
  String get image => 'assets/images/menu.png';

  @override
  String get mainTitle => 'Menu';

  @override
  String get secondaryTitle => FluttemisAppLocalizations.of(context)!.backTo;

  @override
  VoidCallback? get toolAction => () {
        Modular.to.popAndPushNamed('/');
      };

  @override
  String? get toolActionButtonDescription => FluttemisAppLocalizations.of(context)!.goToMenu;

  @override
  IconType? get toolActionButtonIconType => IconType.menu;
}
