import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:flutter/widgets.dart';

import 'data_source_details_widget.dart';
import 'lottie_loading_widget.dart';

class LottieLoadingDataSourceDetailsWidget extends StatelessWidget {
  final AccessHistoryStore accessHistoryStore;

  const LottieLoadingDataSourceDetailsWidget({
    required this.accessHistoryStore,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LottieLoadingWidget(lottieJsonFile: 'assets/lotties/dna-loader.json'),
          const SizedBox(height: 25),
          DataSourceDetailsWidget(accessHistoryStore: accessHistoryStore),
        ],
      );
}
