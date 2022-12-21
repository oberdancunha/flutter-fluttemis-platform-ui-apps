import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_list_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_model.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_multiple_data/overview_multiple_data_item_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_multiple_data/overview_multiple_data_list_widget.dart';
import 'package:flutter/widgets.dart';

class LocusFeaturesOverviewWidget extends StatelessWidget {
  final int total;
  final Map<String, int> featuresTypesCount;

  const LocusFeaturesOverviewWidget({
    required this.total,
    required this.featuresTypesCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) => OverviewDataListWidget(
        title: FluttemisAppLocalizations.of(context)!.locusOverview,
        listOverviewData: [
          OverviewDataModel(
            value: total.toString(),
            description: FluttemisAppLocalizations.of(context)!.totalLocus,
            image: 'assets/images/data/total_locus.png',
          ),
          OverviewDataModel(
            value: featuresTypesCount.length.toString(),
            description: FluttemisAppLocalizations.of(context)!.totalTypeLocus,
            image: 'assets/images/data/total_locus_types.png',
          ),
        ],
        widgets: [
          OverviewMultipleDataListWidget(
            title: FluttemisAppLocalizations.of(context)!.countTypeLocus,
            children: featuresTypesCount.keys
                .map<Widget>(
                  (featureType) => OverviewMultipleDataItemWidget(
                    value: featuresTypesCount[featureType].toString(),
                    label: featureType,
                  ),
                )
                .toList(),
          ),
        ],
      );
}
