import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../application/locus/locus_store.dart';
import '../application/locusShow/locus_show_store.dart';
import '../domain/locus/i_locus_repository.dart';
import '../external/locus/locus_data_source_genbank_file.dart';
import '../infrastructure/locus/i_locus_data_source.dart';
import '../infrastructure/locus/locus_overlap.dart';
import '../infrastructure/locus/locus_repository.dart';

class LocusModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory<ILocusDataSource>(
          (i) {
            final genbankFile = i.args.queryParams['filepath'].toString();

            return LocusDataSourceGenbankFile(genbankFile: genbankFile);
          },
          export: true,
        ),
        Bind.factory<ILocusRepository>(
          (i) => LocusRepository(
            locusDataSource: i<ILocusDataSource>(),
            locusOverlap: LocusOverlap(),
          ),
          export: true,
        ),
        Bind.factory<LocusStore>(
          (i) => LocusStore(locusRepository: i<ILocusRepository>()),
          export: true,
        ),
        Bind.lazySingleton<LocusShowStore>(
          (_) => LocusShowStore(),
          onDispose: (locusShowStore) {
            locusShowStore.dispose();
          },
          export: true,
        ),
      ];
}
