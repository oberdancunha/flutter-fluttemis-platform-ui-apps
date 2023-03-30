import 'package:flutter/rendering.dart';

import 'draw_locus_ruler_marker.dart';

class DrawLocusRulerOuterPositionMarker extends DrawLocusRulerMarker {
  @override
  final Canvas canvas;
  @override
  final TextStyle textStyle;
  final double widthMapArea;
  final int locusLength;
  final int locusLengthByCharacters;

  const DrawLocusRulerOuterPositionMarker({
    required this.canvas,
    required this.textStyle,
    required this.widthMapArea,
    required this.locusLength,
    required this.locusLengthByCharacters,
  }) : super(
          canvas: canvas,
          textStyle: textStyle,
        );

  static const textHeight = 8.0;
  static const factorForCharacterWidth = 10;

  void printStart() {
    printMarker(
      text: '1',
      textAlign: 1,
    );
  }

  void printEnd() {
    final factorToAdjustAlign = locusLengthByCharacters * factorForCharacterWidth;
    final finalMarkerInLine = widthMapArea - factorToAdjustAlign;

    printMarker(
      text: locusLength.toString(),
      textAlign: finalMarkerInLine,
    );
  }
}
