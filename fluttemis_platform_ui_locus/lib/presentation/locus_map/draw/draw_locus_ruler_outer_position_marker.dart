import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_style/platform_text_style.dart';
import 'package:flutter/widgets.dart';

import 'draw_locus_ruler_marker.dart';

class DrawLocusRulerOuterPositionMarker extends DrawLocusRulerMarker {
  @override
  final BuildContext context;
  @override
  final Canvas canvas;
  @override
  final PlatformTextStyle textStyle;
  final double widthMapArea;
  final int locusLength;
  final int locusLengthByCharacters;

  const DrawLocusRulerOuterPositionMarker({
    required this.context,
    required this.canvas,
    required this.textStyle,
    required this.widthMapArea,
    required this.locusLength,
    required this.locusLengthByCharacters,
  }) : super(
          context: context,
          canvas: canvas,
          textStyle: textStyle,
        );

  static const textHeight = 8.0;
  static const factorForCharacterWidth = 7;

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
