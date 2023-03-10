import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/scrollbar/platform_scrollbar_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/platform_text_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_type_enum.dart';
import 'package:flutter/widgets.dart';

class LocusMapFeaturesLabelWidget extends StatelessWidget {
  final double height;
  final List<String> featuresLabel;
  final Map<String, int> featuresTypesCount;
  final int nextLine;
  final ScrollController scrollControllerLabelsFeatures;

  const LocusMapFeaturesLabelWidget({
    required this.height,
    required this.featuresLabel,
    required this.featuresTypesCount,
    required this.nextLine,
    required this.scrollControllerLabelsFeatures,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int nextLinePosition = -10;

    return Positioned(
      left: 2,
      bottom: 0,
      top: 40,
      right: 0,
      child: PlatformScrollbarWidget(
        controller: scrollControllerLabelsFeatures,
        child: SingleChildScrollView(
          controller: scrollControllerLabelsFeatures,
          child: SizedBox(
            height: height,
            child: Stack(
              children: [
                for (String featureLabel in featuresLabel)
                  Positioned(
                    top: double.tryParse((nextLinePosition += nextLine).toString()),
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: PlatformTextWidget(
                      !RegExp('#').hasMatch(featureLabel)
                          ? '$featureLabel (${featuresTypesCount[featureLabel]})'
                          : '',
                      textType: TextType.label,
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
