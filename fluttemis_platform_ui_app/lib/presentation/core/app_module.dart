import 'package:fluttemis_platform_ui_core/driver/file_picker_impl.dart';
import 'package:fluttemis_platform_ui_core/driver/i_file_picker.dart';
import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../home/home_page.dart';
import '../modules/genbank_file_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<IFilePicker>((_) => FilePickerImpl()),
    Bind.lazySingleton((_) => AccessHistoryStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => const HomePage(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/genbankfile/',
      module: GenbankFileModule(),
    ),
  ];
}
