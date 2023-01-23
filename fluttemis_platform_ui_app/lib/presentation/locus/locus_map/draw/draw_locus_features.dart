import 'package:fluttemis_platform_ui_core/domain/locus/feature.dart';
import 'package:fluttemis_platform_ui_core/domain/locus/feature_strand.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/color/platform_color.dart';
import 'package:flutter/widgets.dart';

import 'draw_locus_features_arrow.dart';
import 'draw_locus_features_line.dart';

class DrawLocusFeatures extends CustomPainter {
  final BuildContext context;
  final double widthMapArea;
  final List<Feature> features;
  final double scale;

  DrawLocusFeatures({
    required this.context,
    required this.widthMapArea,
    required this.features,
    required this.scale,
  });

  static const minimalLengthToDrawAdjust = 10;
  static const adjustArrowLigature = 1;

  @override
  void paint(Canvas canvas, Size size) {
    final touchyCanvas = TouchyCanvas(context, canvas);
    features.forEach((feature) {
      final paint = Paint()..color = getPlatformColor(feature.color);
      final featureStart = feature.start * scale;
      final featureEnd = feature.end * scale;
      if ((featureEnd - featureStart) + 1 > minimalLengthToDrawAdjust || feature.product != null) {
        _drawLine(
          touchyCanvas,
          paint,
          featureStart: featureStart,
          featureEnd: featureEnd,
          featureStrand: feature.strand,
        );
        _drawArrow(
          touchyCanvas,
          paint,
          featureStart: featureStart,
          featureEnd: featureEnd,
          featureStrand: feature.strand,
        );
      } else {
        _drawSmallFeature(
          touchyCanvas,
          paint,
          featureEnd: featureEnd,
        );
      }
    });
  }

  void _drawLine(
    TouchyCanvas touchyCanvas,
    Paint paint, {
    required double featureStart,
    required double featureEnd,
    required FeatureStrandType featureStrand,
  }) {
    final drawLocusFeatureLine = DrawLocusFeatureLine(
      featureStart: featureStart,
      featureEnd: featureEnd,
      featureStrand: featureStrand,
      minimalLengthToDrawAdjust: minimalLengthToDrawAdjust,
      adjustArrowLigature: adjustArrowLigature,
    );
    final drawLine = drawLocusFeatureLine.draw();
    touchyCanvas.drawRRect(drawLine, paint);
  }

  void _drawArrow(
    TouchyCanvas touchyCanvas,
    Paint paint, {
    required double featureStart,
    required double featureEnd,
    required FeatureStrandType featureStrand,
  }) {
    final drawLocusFeatureArrow = DrawLocusFeatureArrow(
      featureStart: featureStart,
      featureEnd: featureEnd,
      featureStrand: featureStrand,
    );
    final path = drawLocusFeatureArrow.draw();
    touchyCanvas.drawPath(
      path,
      paint,
    );
  }

  void _drawSmallFeature(
    TouchyCanvas touchyCanvas,
    Paint paint, {
    required double featureEnd,
  }) {
    final center = Offset(featureEnd, 0);
    paint.strokeWidth = 1;
    touchyCanvas.drawLine(
      Offset(center.dx, center.dy + 7),
      Offset(center.dx, center.dy - 7),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
