import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/color/platform_color.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/container/platform_container_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/platform_text_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_style/label_text_style.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_style/sub_title_text_style.dart';
import 'package:flutter/widgets.dart';

import '../../domain/feature/feature_product_type.dart';

class LocusMapProductLabelWidget extends StatelessWidget {
  const LocusMapProductLabelWidget({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlatformTextWidget(
              FluttemisAppLocalizations.of(context)!.productColorLabel,
              textStyle: SubTitleTextStyle(),
              fontSize: 13,
            ),
            const SizedBox(height: 9),
            Row(
              children: FeatureProductType.values
                  .map<Widget>(
                    (productType) => Row(
                      children: [
                        Column(
                          children: [
                            PlatformTextWidget(
                              '${productType.name} product',
                              textStyle: LabelTextStyle(),
                              fontSize: 10,
                            ),
                            const SizedBox(height: 9),
                            PlatformContainerWidget(
                              width: 100,
                              height: 2.5,
                              backgroundColor: PlatformColor(productType.color)(),
                            ),
                          ],
                        ),
                        const SizedBox(width: 25),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      );
}
