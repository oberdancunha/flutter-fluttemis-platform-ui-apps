import 'dart:math' as math;

import 'package:fluttemis_platform_ui_core/domain/locus/feature.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/border_radius/platform_border_radius.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/color/platform_color.dart';
import 'package:flutter/widgets.dart';

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
    features.forEach((feature) {
      final touchyCanvas = TouchyCanvas(context, canvas);
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
    required int featureStrand,
  }) {
    int adjustLineLengthToDraw = 12;
    if ((featureEnd - featureStart) + 1 <= minimalLengthToDrawAdjust) {
      adjustLineLengthToDraw = 9;
    }
    const top = 0.0;
    final left = featureStrand == 0
        ? featureStart
        : featureStart + adjustLineLengthToDraw - adjustArrowLigature;
    final right =
        featureStrand == 0 ? featureEnd - adjustLineLengthToDraw + adjustArrowLigature : featureEnd;
    const bottom = 6.5;
    final rect = Rect.fromLTRB(
      left,
      top,
      right,
      bottom,
    );
    final borderRadius = getPlatformBorderRadiusToDrawFeature(featureStrand);
    final rrect = borderRadius.toRRect(rect);
    touchyCanvas.drawRRect(rrect, paint);
  }

  void _drawArrow(
    TouchyCanvas touchyCanvas,
    Paint paint, {
    required double featureStart,
    required double featureEnd,
    required int featureStrand,
  }) {
    final path = Path();
    const radius = 8.0;
    const sides = 3.0;
    const angle = (math.pi * 2) / sides;
    final radians = featureStrand == 0 ? 0.0 : 20.0;
    var adjustArrowLengthToDraw = 8;
    if ((featureEnd - featureStart) + 1 <= minimalLengthToDrawAdjust) {
      adjustArrowLengthToDraw = 6;
    }
    const topOrBottomBasePosition = 3.0;
    final leftOrRightPosition = featureStrand == 0
        ? featureEnd - adjustArrowLengthToDraw
        : featureStart + adjustArrowLengthToDraw;
    final center = Offset(leftOrRightPosition, topOrBottomBasePosition);
    final startPoint = Offset(
      radius * math.cos(radians),
      radius * math.sin(radians),
    );
    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);
    for (int edge = 1; edge <= sides; edge++) {
      final x = radius * math.cos(radians + angle * edge) + center.dx;
      final y = radius * math.sin(radians + angle * edge) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
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
