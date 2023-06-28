import 'package:fluttemis_platform_ui_core/driver/file_picker_impl.dart';
import 'package:fluttemis_platform_ui_core/driver/i_file_picker.dart';
import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/menu_tools/menu_tools_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/icon_button/button_status/button_status_store.dart';
import 'package:flutter/material.dart';

import '../home/home_page.dart';
import '../modules/genbank_file_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<IFilePicker>((_) => FilePickerImpl()),
    Bind.lazySingleton<ValueNotifier>(
      (_) => AccessHistoryStore(),
      onDispose: (accessHistoryStore) => accessHistoryStore.dispose(),
    ),
    Bind.lazySingleton<ChangeNotifier>(
      (_) => ButtonStatusStore(),
      onDispose: (buttonStatusStore) => buttonStatusStore.dispose(),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => const HomePage(),
      transition: TransitionType.fadeIn,
      children: [
        ChildRoute(
          '/menutools/',
          child: (_, __) => const MenuToolsWidget(),
        ),
        ModuleRoute(
          '/genbankfile/',
          module: GenbankFileModule(),
        ),
      ],
    ),
  ];
}
