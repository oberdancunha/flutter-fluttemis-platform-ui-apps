import 'package:flutter/rendering.dart';

import 'draw_locus_ruler_inner_position_marker.dart';
import 'draw_locus_ruler_outer_position_marker.dart';

class DrawLocusRuler extends CustomPainter {
  final double widthMapArea;
  final int locusLength;
  final double scale;
  final int pixelsPerCharacter;
  final int locusLengthByCharacters;
  final TextStyle textStyle;

  const DrawLocusRuler({
    required this.widthMapArea,
    required this.locusLength,
    required this.scale,
    required this.pixelsPerCharacter,
    required this.locusLengthByCharacters,
    required this.textStyle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..strokeWidth = 1;
    _drawLine(canvas, paint);
    DrawLocusRulerOuterPositionMarker(
      canvas: canvas,
      textStyle: textStyle,
      widthMapArea: widthMapArea,
      locusLength: locusLength,
      locusLengthByCharacters: locusLengthByCharacters,
    )
      ..printStart()
      ..printEnd();
    DrawLocusRulerInnerPositionMarker(
      canvas: canvas,
      textStyle: textStyle,
      paint: paint,
      locusLength: locusLength,
      scale: scale,
      pixelsPerCharacter: pixelsPerCharacter,
      locusLengthByCharacters: locusLengthByCharacters,
    ).print();
  }

  void _drawLine(Canvas canvas, Paint paint) {
    const factorToAdjustAngle = 28.0;
    final rightSizeAngle = Offset(widthMapArea, factorToAdjustAngle);
    const leftSizeAngle = Offset(1, factorToAdjustAngle);
    canvas.drawLine(
      rightSizeAngle,
      leftSizeAngle,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}