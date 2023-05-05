import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_locus/application/locus/locus_store.dart';
import 'package:fluttemis_platform_ui_locus/application/locusShow/locus_show_store.dart';
import 'package:fluttemis_platform_ui_locus/configurations/locus_module.dart';
import 'package:fluttemis_platform_ui_locus/presentation/locus_widget.dart';

class GenbankFileModule extends Module {
  @override
  List<Module> get imports => [
        LocusModule(),
      ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, args) {
        Modular.dispose<LocusShowStore>();

        return LocusWidget(
          locusStore: Modular.get<LocusStore>(),
          accessHistoryStore: Modular.get<AccessHistoryStore>(),
        );
      },
      transition: TransitionType.fadeIn,
    ),
  ];
}
