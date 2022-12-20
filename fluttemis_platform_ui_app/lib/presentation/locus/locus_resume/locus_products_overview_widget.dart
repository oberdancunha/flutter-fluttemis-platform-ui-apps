import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_list_widget.dart';
import 'package:flutter/widgets.dart';

class LocusProductsOverviewWidget extends StatelessWidget {
  final Map<String, int> featuresTypesProductsCount;

  const LocusProductsOverviewWidget({
    required this.featuresTypesProductsCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) => const OverviewDataListWidget(
        title: 'Dados gerais dos produtos',
        listOverviewData: [],
      );
}
