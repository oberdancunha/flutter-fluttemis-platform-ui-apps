import 'package:fluttemis_platform_ui_core/utils/product_dictionary.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/color/platform_color.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/container/platform_container_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/platform_text_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_type_enum.dart';
import 'package:flutter/widgets.dart';

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
              textType: TextType.subTitle,
              fontSize: 17.5,
            ),
            const SizedBox(height: 9),
            Row(
              children: productDictionaryLabel.keys
                  .map<Widget>(
                    (productLabelColor) => Row(
                      children: [
                        Column(
                          children: [
                            PlatformTextWidget(
                              '${productDictionaryLabel[productLabelColor]} product',
                              textType: TextType.label,
                              fontSize: 12,
                            ),
                            const SizedBox(height: 9),
                            PlatformContainerWidget(
                              width: 100,
                              height: 2.5,
                              backgroundColor: getPlatformColor(productLabelColor),
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
