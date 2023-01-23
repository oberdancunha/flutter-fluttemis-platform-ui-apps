import 'package:fluttemis_platform_ui_core/domain/locus/feature_strand.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/border_radius/platform_border_radius.dart';
import 'package:flutter/painting.dart';

class DrawLocusFeatureLine {
  final double featureStart;
  final double featureEnd;
  final FeatureStrandType featureStrand;
  final int minimalLengthToDrawAdjust;
  final int adjustArrowLigature;

  const DrawLocusFeatureLine({
    required this.featureStart,
    required this.featureEnd,
    required this.featureStrand,
    required this.minimalLengthToDrawAdjust,
    required this.adjustArrowLigature,
  });

  static const defaultAdjustLineLengthToDraw = 12;

  RRect draw() {
    const top = 0.0;
    const bottom = 6.5;
    final rect = Rect.fromLTRB(
      left,
      top,
      right,
      bottom,
    );
    final borderRadius = getPlatformBorderRadiusToDrawFeature(featureStrand);
    final drawLine = borderRadius.toRRect(rect);

    return drawLine;
  }

  bool _isFeatureLengthLessThanMinimum() =>
      (featureEnd - featureStart) + 1 <= minimalLengthToDrawAdjust;

  int get adjustLineLengthToDraw =>
      _isFeatureLengthLessThanMinimum() ? 9 : defaultAdjustLineLengthToDraw;

  double get left => featureStrand == FeatureStrandType.upstream
      ? featureStart
      : featureStart + adjustLineLengthToDraw - adjustArrowLigature;

  double get right => featureStrand == FeatureStrandType.upstream
      ? featureEnd - adjustLineLengthToDraw + adjustArrowLigature
      : featureEnd;
}
