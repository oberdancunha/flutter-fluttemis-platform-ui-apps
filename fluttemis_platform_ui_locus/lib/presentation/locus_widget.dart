import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/app_scaffold/app_scaffold_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/failure_message/failure_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/loading/lottie_loading_data_source_details_widget.dart';
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
  Widget build(BuildContext context) => AppScaffoldWidget(
        body: Center(
          child: ValueListenableBuilder(
            valueListenable: widget.locusStore,
            builder: (_, locusState, __) => locusState.join(
              (initial) => const SizedBox.shrink(),
              (loading) => LottieLoadingDataSourceDetailsWidget(
                accessHistoryStore: widget.accessHistoryStore,
              ),
              (success) => LocusPage(locus: success.locus),
              (failure) => FailureWidget(failure: failure.message),
            ),
          ),
        ),
      );
}
