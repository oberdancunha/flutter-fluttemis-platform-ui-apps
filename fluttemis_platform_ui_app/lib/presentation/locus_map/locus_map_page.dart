import 'package:fluttemis_platform_ui_core/application/locus/locus_store.dart';
import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/error_message/error_message_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/loading/lottie_loading_resource_details_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/scaffold/platform_scaffold_widget.dart';
import 'package:flutter/widgets.dart';

class LocusMapPage extends StatefulWidget {
  final LocusStore locusStore;
  final AccessHistoryStore accessHistoryStore;

  const LocusMapPage({
    required this.locusStore,
    required this.accessHistoryStore,
    super.key,
  });

  @override
  State<LocusMapPage> createState() => _LocusMapPageState();
}

class _LocusMapPageState extends State<LocusMapPage> {
  @override
  void initState() {
    super.initState();
    widget.locusStore.getLocus();
  }

  @override
  Widget build(BuildContext context) => PlatformScaffoldWidget(
        body: Center(
          child: ValueListenableBuilder(
            valueListenable: widget.locusStore,
            builder: (_, locusState, __) {
              if (locusState.isLoading) {
                return LottieLoadingResourceDetailsWidget(
                  accessHistoryStore: widget.accessHistoryStore,
                );
              }

              if (locusState.failure != null) {
                return ErrorMessageWidget(failure: locusState.failure!);
              }

              return SizedBox(
                child: Center(
                  child: Text(
                    'Vamos ler um arquivo dos genbanks....${locusState.locus.get(0).name} - ${locusState.locus.get(0).length}',
                  ),
                ),
              );
            },
          ),
        ),
      );
}
