import 'package:fluttemis_platform_ui_core/application/locus/locus_store.dart';
import 'package:fluttemis_platform_ui_core/configurations/genbank_module_binds.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../locus_map/locus_map_page.dart';

class GenbankModule extends Module {
  @override
  final List<Bind> binds = [...genbankModuleBinds];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => LocusMapPage(
        locusStore: Modular.get<LocusStore>(),
      ),
    ),
  ];
}
