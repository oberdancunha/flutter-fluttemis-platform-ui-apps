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
  Widget build(BuildContext context) {
    final fluttemisAppLocalizations = FluttemisAppLocalizations.of(context)!;
    const assetsImagesPath = 'assets/images/data';

    return OverviewDataListWidget(
      title: fluttemisAppLocalizations.featureOverview,
      listOverviewData: [
        OverviewDataModel(
          value: total.toString(),
          description: fluttemisAppLocalizations.totalFeature,
          image: '$assetsImagesPath/total_feature.png',
        ),
        OverviewDataModel(
          value: featuresTypesCount.length.toString(),
          description: fluttemisAppLocalizations.totalTypeFeature,
          image: '$assetsImagesPath/total_type_feature.png',
        ),
      ],
      widgets: [
        OverviewMultipleDataListWidget(
          title: fluttemisAppLocalizations.countTypeFeature,
          dataListLength: featuresTypesCount.keys.length,
          children: featuresTypesCount.keys
              .map(
                (featureType) => OverviewMultipleDataItemWidget(
                  value: featuresTypesCount[featureType].toString(),
                  label: featureType,
                  representativeWidget: Image.asset(
                    '$assetsImagesPath/count_type_feature.png',
                    width: 28,
                    fit: BoxFit.cover,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
