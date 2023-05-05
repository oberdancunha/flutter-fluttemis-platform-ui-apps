import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../application/locus/locus_store.dart';
import '../domain/locus/i_locus_repository.dart';
import '../infrastructure/locus/i_locus_data_source.dart';
import '../infrastructure/locus/locus_overlap.dart';
import '../infrastructure/locus/locus_repository.dart';

class LocusModule extends Module {
  @override
  List<Bind<Object>> get binds => [
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
      ];
}
