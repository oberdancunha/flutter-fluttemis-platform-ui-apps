import 'package:flutter/material.dart';

class DrawLocusRulerMarker {
  final Canvas canvas;
  final TextStyle textStyle;

  const DrawLocusRulerMarker({
    required this.canvas,
    required this.textStyle,
  });

  void printMarker({
    required String text,
    required double textAlign,
  }) {
    const textHeight = 8.0;

    final textSpan = TextSpan(
      style: textStyle.copyWith(
        fontSize: 12,
      ),
      text: text,
    );
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
}
