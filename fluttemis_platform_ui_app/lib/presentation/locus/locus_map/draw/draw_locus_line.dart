import 'package:flutter/rendering.dart';

class DrawLocusLine extends CustomPainter {
  final double width;
  final int locusLength;
  final double scale;
  final int pixelsPerCharacter;
  final int locusLengthByCharacters;
  final TextStyle textStyle;

  const DrawLocusLine({
    required this.width,
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
    _drawMarker(canvas, paint);
  }

  void _drawLine(Canvas canvas, Paint paint) {
    const factorToAdjustAngle = 28.0;
    final rightSizeAngle = Offset(width, factorToAdjustAngle);
    const leftSizeAngle = Offset(1, factorToAdjustAngle);
    canvas.drawLine(
      rightSizeAngle,
      leftSizeAngle,
      paint,
    );
    _printMarker(
      canvas: canvas,
      text: '1',
      textAlign: 1,
    );
    final factorToAdjustAlign = locusLengthByCharacters * 10;
    final finalMarkerInLine = width - factorToAdjustAlign;
    _printMarker(
      canvas: canvas,
      text: locusLength.toString(),
      textAlign: finalMarkerInLine,
    );
  }

  void _printMarker({
    required Canvas canvas,
    required String text,
    required double textAlign,
  }) {
    final textSpan = TextSpan(
      style: textStyle.copyWith(
        fontSize: 12,
      ),
      text: text,
    );
    const textHeight = 8.0;
    TextPainter(
      text: textSpan,
      textDirection: TextDirection.rtl,
      maxLines: 1,
    )
      ..layout(
        minWidth: 1,
        maxWidth: 80,
      )
      ..paint(
        canvas,
        Offset(textAlign, textHeight),
      );
  }

  void _drawMarker(Canvas canvas, Paint paint) {
    final minWidthPerMarker = pixelsPerCharacter * locusLengthByCharacters;
    final markingPoints = (locusLength / minWidthPerMarker).round();
    for (int marker = markingPoints;
        marker + markingPoints <= locusLength;
        marker += markingPoints) {
      const markerTopPosition = 23.0;
      const markerBottomPosition = 33.0;
      final markerScale = marker * scale;
      final markerTop = Offset(markerScale, markerTopPosition);
      final markerBottom = Offset(markerScale, markerBottomPosition);
      canvas.drawLine(markerTop, markerBottom, paint);
      _printMarker(
        canvas: canvas,
        text: marker.toString(),
        textAlign: markerScale,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
