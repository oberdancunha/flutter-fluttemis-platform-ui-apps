import 'package:fluttemis_platform_ui_core/domain/locus/feature.dart';
import 'package:flutter/widgets.dart';

import 'draw/draw_locus_features.dart';

class LocusMapDrawFeaturesWidget extends StatelessWidget {
  final List<List<Feature>> featuresTypes;
  final double widthMapArea;
  final double scale;

  const LocusMapDrawFeaturesWidget({
    required this.featuresTypes,
    required this.widthMapArea,
    required this.scale,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int nextLine = 25;

    return Stack(
      children: [
        for (List<Feature> features in featuresTypes)
          Positioned(
            top: double.tryParse((nextLine += 20).toString()),
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
    );
  }
}
