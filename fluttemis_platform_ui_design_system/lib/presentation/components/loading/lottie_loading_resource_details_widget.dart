import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:flutter/widgets.dart';

import 'lottie_loading_widget.dart';
import 'resource_details_widget.dart';

class LottieLoadingResourceDetailsWidget extends StatelessWidget {
  final AccessHistoryStore accessHistoryStore;

  const LottieLoadingResourceDetailsWidget({
    required this.accessHistoryStore,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LottieLoadingWidget(lottieJsonFile: 'assets/lotties/dna-loader.json'),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03),
          ResourceDetailsWidget(accessHistoryStore: accessHistoryStore),
        ],
      );
}
