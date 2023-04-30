import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_list_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_model.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_multiple_data/overview_multiple_data_item_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_multiple_data/overview_multiple_data_list_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/color/platform_color.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/container/platform_container_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/dialog/platform_dialog_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/icon/icon_type_enum.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/icon/platform_icon_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/icon_button/platform_icon_button_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/show_dialog/platform_show_dialog.dart';
import 'package:flutter/widgets.dart';

import '../../domain/feature/feature.dart';
import '../../domain/feature/feature_product_type.dart';
import 'locus_features/locus_features_table_widget.dart';

class LocusProductsOverviewWidget extends StatelessWidget {
  final KtList<Feature> features;
  final int totalProductsFeatures;
  final Map<String, int> featuresTypesProductsCount;

  const LocusProductsOverviewWidget({
    required this.features,
    required this.totalProductsFeatures,
    required this.featuresTypesProductsCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fluttemisAppLocalizations = FluttemisAppLocalizations.of(context)!;

    return OverviewDataListWidget(
      title: fluttemisAppLocalizations.productOverview,
      listOverviewData: [
        OverviewDataModel(
          value: totalProductsFeatures.toString(),
          description: fluttemisAppLocalizations.totalFeatureProduct,
          image: 'assets/images/data/total_product_feature.png',
        ),
        OverviewDataModel(
          value: featuresTypesProductsCount.length.toString(),
          description: fluttemisAppLocalizations.totalTypeProduct,
          image: 'assets/images/data/total_type_product.png',
        ),
      ],
      widgets: [
        if (featuresTypesProductsCount.isNotEmpty)
          OverviewMultipleDataListWidget(
            title: fluttemisAppLocalizations.countTypeProduct,
            dataListLength: featuresTypesProductsCount.keys.length,
            children: featuresTypesProductsCount.keys
                .map(
                  (productType) => OverviewMultipleDataItemWidget(
                    value: featuresTypesProductsCount[productType].toString(),
                    label: productType,
                    representativeWidget: PlatformContainerWidget(
                      backgroundColor: getPlatformColor(
                        FeatureProductType.values
                            .firstWhere(
                              (featureProductType) =>
                                  featureProductType.name.toLowerCase() ==
                                  productType.toLowerCase(),
                            )
                            .color,
                      ),
                      width: 30,
                      height: 4,
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
            label: fluttemisAppLocalizations.featureTable,
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
