import 'package:fluttemis_platform_ui_core/utils/product_dictionary.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_list_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_model.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_multiple_data/overview_multiple_data_item_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_multiple_data/overview_multiple_data_list_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/color/platform_color.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/container/platform_container_widget.dart';
import 'package:flutter/widgets.dart';

class LocusProductsOverviewWidget extends StatelessWidget {
  final Map<String, int> featuresTypesProductsCount;

  const LocusProductsOverviewWidget({
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
          value: featuresTypesProductsCount.length.toString(),
          description: fluttemisAppLocalizations.totalTypeProducts,
          image: 'assets/images/data/total_locus_products.png',
        ),
      ],
      widgets: [
        OverviewMultipleDataListWidget(
          title: fluttemisAppLocalizations.countTypeProducts,
          children: featuresTypesProductsCount.keys
              .map(
                (productType) => OverviewMultipleDataItemWidget(
                  value: featuresTypesProductsCount[productType].toString(),
                  label: productType,
                  representativeWidget: PlatformContainerWidget(
                    backgroundColor: getPlatformColor(
                      productDictionaryLabel.keys.firstWhere(
                        (color) => productDictionaryLabel[color] == productType,
                      ),
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
