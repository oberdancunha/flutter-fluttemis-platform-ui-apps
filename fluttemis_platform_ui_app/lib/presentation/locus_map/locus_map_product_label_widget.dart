import 'package:fluttemis_platform_ui_core/utils/product_dictionary.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/color/platform_color.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/container/platform_container_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/platform_text_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_type_enum.dart';
import 'package:flutter/widgets.dart';

class LocusMapProductLabelWidget extends StatelessWidget {
  const LocusMapProductLabelWidget({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) => SizedBox(
          width: constraints.maxWidth,
          child: Padding(
            padding: EdgeInsets.all(constraints.maxWidth * 0.009),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlatformTextWidget(
                  'Product color label',
                  textType: TextType.subTitle,
                  fontSize: constraints.maxWidth * 0.014,
                ),
                SizedBox(height: constraints.maxHeight * 0.1),
                Row(
                  children: productDictionaryLabel.keys
                      .map<Widget>(
                        (productLabelColor) => Row(
                          children: [
                            Column(
                              children: [
                                PlatformTextWidget(
                                  '${productDictionaryLabel[productLabelColor]} product',
                                  textType: TextType.subTitle,
                                  fontSize: constraints.maxWidth * 0.009,
                                ),
                                SizedBox(height: constraints.maxHeight * 0.1),
                                PlatformContainerWidget(
                                  width: constraints.maxWidth * 0.08,
                                  height: constraints.maxHeight * 0.03,
                                  backgroundColor: getPlatformColor(productLabelColor),
                                ),
                              ],
                            ),
                            SizedBox(width: constraints.maxWidth * 0.02),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      );
}
