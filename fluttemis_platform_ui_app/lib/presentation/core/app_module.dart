import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../home/home_page.dart';
import '../modules/genbank_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => const HomePage(),
    ),
    ModuleRoute(
      '/genbank/',
      module: GenbankModule(),
    ),
  ];
}
