import 'dart:math' as math;

import 'package:flutter/painting.dart';

class DrawLocusFeatureArrow {
  final double featureStart;
  final double featureEnd;
  final int featureStrand;

  const DrawLocusFeatureArrow({
    required this.featureStart,
    required this.featureEnd,
    required this.featureStrand,
  });

  static const minimalLengthToDrawAdjust = 10;
  static const defaultAdjustArrowLengthToDraw = 8;
  static const radius = 8.0;
  static const sides = 3.0;
  static const angle = (math.pi * 2) / sides;
  static const topOrBottomBasePosition = 3.0;

  Path draw() {
    final path = Path();
    _drawArrow(path);
    path.close();

    return path;
  }

  bool _isFeatureLengthLessThanMinimum() =>
      (featureEnd - featureStart) + 1 <= minimalLengthToDrawAdjust;

  int get adjustArrowLengthToDraw =>
      _isFeatureLengthLessThanMinimum() ? 6 : defaultAdjustArrowLengthToDraw;

  double get radians => featureStrand == 0 ? 0.0 : 20.0;

  double get rightOrLeftPosition => featureStrand == 0 ? _rightPosition : _leftPosition;

  double get _rightPosition => featureEnd - adjustArrowLengthToDraw;

  double get _leftPosition => featureStart + adjustArrowLengthToDraw;

  Offset get startPoint => Offset(
        radius * math.cos(radians),
        radius * math.sin(radians),
      );

  Offset get arrowCenterPosition => Offset(rightOrLeftPosition, topOrBottomBasePosition);

  void _drawArrow(Path path) {
    path.moveTo(
      startPoint.dx + arrowCenterPosition.dx,
      startPoint.dy + arrowCenterPosition.dy,
    );
    for (int edge = 1; edge <= sides; edge++) {
      final x = radius * math.cos(radians + angle * edge) + arrowCenterPosition.dx;
      final y = radius * math.sin(radians + angle * edge) + arrowCenterPosition.dy;
      path.lineTo(x, y);
    }
  }
}
