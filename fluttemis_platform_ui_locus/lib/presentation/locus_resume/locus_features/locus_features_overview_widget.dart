import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_list_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_model.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_multiple_data/overview_multiple_data_item_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_multiple_data/overview_multiple_data_list_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/dialog/platform_dialog_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/icon/icon_type_enum.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/icon/platform_icon_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/icon_button/platform_icon_button_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/show_dialog/platform_show_dialog.dart';
import 'package:flutter/widgets.dart';

import '../../../domain/feature/feature.dart';
import 'locus_features_table_widget.dart';

class LocusFeaturesOverviewWidget extends StatelessWidget {
  final KtList<Feature> features;
  final int total;
  final Map<String, int> featuresTypesCount;

  const LocusFeaturesOverviewWidget({
    required this.features,
    required this.total,
    required this.featuresTypesCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fluttemisAppLocalizations = FluttemisAppLocalizations.of(context)!;
    const assetsImagesPath = 'assets/images/data';

    return OverviewDataListWidget(
      title: fluttemisAppLocalizations.featuresOverview,
      listOverviewData: [
        OverviewDataModel(
          value: total.toString(),
          description: fluttemisAppLocalizations.totalFeatures,
          image: '$assetsImagesPath/total_feature.png',
        ),
        OverviewDataModel(
          value: featuresTypesCount.length.toString(),
          description: fluttemisAppLocalizations.totalTypeFeatures,
          image: '$assetsImagesPath/total_type_feature.png',
        ),
      ],
      widgets: [
        OverviewMultipleDataListWidget(
          title: fluttemisAppLocalizations.countTypeFeatures,
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
      titleComplementWidgets: [
        SizedBox(
          height: 25,
          child: PlatformIconButtonWidget(
            icon: const PlatformIconWidget(
              iconType: IconType.table,
              size: 10,
            ),
            label: fluttemisAppLocalizations.featuresTable,
            fontSize: 9,
            onPressed: () => platformShowDialog(
              context: context,
              builder: (_) => PlatformDialogWidget(
                child: LocusFeaturesTableWidget(
                  features: features,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
