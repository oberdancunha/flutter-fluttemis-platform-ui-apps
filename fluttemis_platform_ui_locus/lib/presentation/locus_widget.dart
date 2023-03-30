import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/error_message/error_message_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/loading/lottie_loading_data_source_details_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/scaffold/platform_scaffold_widget.dart';
import 'package:flutter/widgets.dart';

import '../application/locus/locus_store.dart';
import 'locus_page.dart';

class LocusWidget extends StatefulWidget {
  final LocusStore locusStore;
  final AccessHistoryStore accessHistoryStore;

  const LocusWidget({
    required this.locusStore,
    required this.accessHistoryStore,
    super.key,
  });

  @override
  State<LocusWidget> createState() => _LocusWidgetState();
}

class _LocusWidgetState extends State<LocusWidget> {
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
                return LottieLoadingDataSourceDetailsWidget(
                  accessHistoryStore: widget.accessHistoryStore,
                );
              }

              if (locusState.failure != null) {
                return ErrorMessageWidget(failure: locusState.failure!);
              }

              return LocusPage(locus: locusState.locus);
            },
          ),
        ),
      );
}
