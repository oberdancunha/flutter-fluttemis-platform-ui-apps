import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_list_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_model.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_multiple_data/overview_multiple_data_item_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_multiple_data/overview_multiple_data_list_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/color/platform_color.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/container/platform_container_widget.dart';
import 'package:flutter/widgets.dart';

import '../../domain/feature/feature_product_type.dart';

class LocusProductsOverviewWidget extends StatelessWidget {
  final int totalProductsFeatures;
  final Map<String, int> featuresTypesProductsCount;

  const LocusProductsOverviewWidget({
    required this.totalProductsFeatures,
    required this.featuresTypesProductsCount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fluttemisAppLocalizations = FluttemisAppLocalizations.of(context)!;

    return OverviewDataListWidget(
      title: fluttemisAppLocalizations.productsOverview,
      listOverviewData: [
        OverviewDataModel(
          value: totalProductsFeatures.toString(),
          description: fluttemisAppLocalizations.totalFeatureProduct,
          image: 'assets/images/data/total_product_feature.png',
        ),
        OverviewDataModel(
          value: featuresTypesProductsCount.length.toString(),
          description: fluttemisAppLocalizations.totalTypeProducts,
          image: 'assets/images/data/total_type_product.png',
        ),
      ],
      widgets: [
        if (featuresTypesProductsCount.isNotEmpty)
          OverviewMultipleDataListWidget(
            title: fluttemisAppLocalizations.countTypeProducts,
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
    );
  }
}
