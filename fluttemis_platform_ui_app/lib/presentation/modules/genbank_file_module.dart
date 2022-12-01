import 'package:fluttemis_platform_ui_core/application/locus/locus_store.dart';
import 'package:fluttemis_platform_ui_core/configurations/locus_module_binds.dart';
import 'package:fluttemis_platform_ui_core/external/locus/locus_data_source_genbank_file.dart';
import 'package:fluttemis_platform_ui_core/infrastructure/locus/i_locus_data_source.dart';
import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../locus_map/locus_map_page.dart';

class GenbankFileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<ILocusDataSource>(
      (i) {
        final genbankFile = i.args.data.toString();

        return LocusDataSourceGenbankFile(genbankFile: genbankFile);
      },
    ),
    ...locusModuleBinds,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => LocusMapPage(
        locusStore: Modular.get<LocusStore>(),
        accessHistoryStore: Modular.get<AccessHistoryStore>(),
      ),
      transition: TransitionType.fadeIn,
    ),
  ];
}
