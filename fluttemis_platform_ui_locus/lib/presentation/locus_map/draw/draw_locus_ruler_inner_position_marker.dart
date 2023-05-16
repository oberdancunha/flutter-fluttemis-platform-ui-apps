import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_style/platform_text_style.dart';
import 'package:flutter/widgets.dart';

import 'draw_locus_ruler_marker.dart';

class DrawLocusRulerInnerPositionMarker extends DrawLocusRulerMarker {
  @override
  final BuildContext context;
  @override
  final Canvas canvas;
  @override
  final PlatformTextStyle textStyle;
  final Paint paint;
  final int locusLength;
  final double scale;
  final int pixelsPerCharacter;
  final int locusLengthByCharacters;

  const DrawLocusRulerInnerPositionMarker({
    required this.context,
    required this.canvas,
    required this.textStyle,
    required this.paint,
    required this.locusLength,
    required this.scale,
    required this.pixelsPerCharacter,
    required this.locusLengthByCharacters,
  }) : super(
          context: context,
          canvas: canvas,
          textStyle: textStyle,
        );

  static const markerTopPosition = 23.0;
  static const markerBottomPosition = 33.0;

  void print() {
    for (int marker = markingPoints;
        marker + markingPoints <= locusLength;
        marker += markingPoints) {
      final markerScale = marker * scale;
      final markerTop = Offset(markerScale, markerTopPosition);
      final markerBottom = Offset(markerScale, markerBottomPosition);
      canvas.drawLine(markerTop, markerBottom, paint);
      printMarker(
        text: marker.toString(),
        textAlign: markerScale,
      );
    }
  }

  int get minWidthPerMarker => pixelsPerCharacter * locusLengthByCharacters;

  int get markingPoints => (locusLength / minWidthPerMarker).round();
}
