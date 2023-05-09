import 'dart:async';

import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../../platform/icon/icon_data/menu_icon_data.dart';
import '../../platform/icon/icon_data/platform_icon_data.dart';
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
  String? get toolActionButtonDescription => FluttemisAppLocalizations.of(context)!.goToMenu;

  @override
  PlatformIconData? get toolActionButtonIconData => MenuIconData();

  @override
  FutureOr<bool> coreToolAction() {
    Modular.dispose<AccessHistoryStore>();

    return true;
  }

  @override
  String get route => '/menutools/';
}
