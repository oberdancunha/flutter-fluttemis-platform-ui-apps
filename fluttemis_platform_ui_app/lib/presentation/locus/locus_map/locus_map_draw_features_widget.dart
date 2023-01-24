import 'package:fluttemis_platform_ui_core/domain/locus/feature.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/scrollbar/platform_scrollbar_widget.dart';
import 'package:flutter/widgets.dart';

import 'draw/draw_locus_features.dart';

class LocusMapDrawFeaturesWidget extends StatelessWidget {
  final double height;
  final double widthMapArea;
  final List<List<Feature>> featuresTypes;
  final double scale;
  final int nextLine;
  final ScrollController scrollControllerRulerFeatures;
  final ScrollController scrollControllerLabelsFeatures;

  const LocusMapDrawFeaturesWidget({
    required this.height,
    required this.widthMapArea,
    required this.featuresTypes,
    required this.scale,
    required this.nextLine,
    required this.scrollControllerRulerFeatures,
    required this.scrollControllerLabelsFeatures,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int nextLinePosition = -10;

    return Positioned(
      left: 125,
      bottom: 0,
      top: 40,
      right: 20,
      child: PlatformScrollbarWidget(
        controller: scrollControllerRulerFeatures,
        child: SingleChildScrollView(
          controller: scrollControllerRulerFeatures,
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 5,
              bottom: 20,
            ),
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                controller: scrollControllerLabelsFeatures,
                child: SizedBox(
                  height: height,
                  width: widthMapArea,
                  child: Stack(
                    children: [
                      for (List<Feature> features in featuresTypes)
                        Positioned(
                          top: double.tryParse((nextLinePosition += nextLine).toString()),
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: CustomPaint(
                            painter: DrawLocusFeatures(
                              context: context,
                              widthMapArea: widthMapArea,
                              features: features,
                              scale: scale,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
