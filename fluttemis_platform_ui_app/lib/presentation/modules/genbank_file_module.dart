import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_locus/application/locus/locus_store.dart';
import 'package:fluttemis_platform_ui_locus/application/locusShow/locus_show_store.dart';
import 'package:fluttemis_platform_ui_locus/configurations/locus_module_binds.dart';
import 'package:fluttemis_platform_ui_locus/external/locus/locus_data_source_genbank_file.dart';
import 'package:fluttemis_platform_ui_locus/infrastructure/locus/i_locus_data_source.dart';
import 'package:fluttemis_platform_ui_locus/presentation/locus_widget.dart';

class GenbankFileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory<ILocusDataSource>(
      (i) {
        final genbankFile = i.args.queryParams['filepath'].toString();

        return LocusDataSourceGenbankFile(genbankFile: genbankFile);
      },
    ),
    ...locusModuleBinds,
    Bind.lazySingleton<LocusShowStore>(
      (_) => LocusShowStore(),
      onDispose: (locusShowStore) {
        locusShowStore.dispose();
      },
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) => LocusWidget(
        locusStore: Modular.get<LocusStore>(),
        accessHistoryStore: Modular.get<AccessHistoryStore>(),
      ),
      transition: TransitionType.fadeIn,
    ),
  ];
}
