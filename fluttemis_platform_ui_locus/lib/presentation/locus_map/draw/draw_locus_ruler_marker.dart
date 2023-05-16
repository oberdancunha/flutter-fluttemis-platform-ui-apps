import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_style/platform_text_style.dart';
import 'package:flutter/material.dart';

class DrawLocusRulerMarker {
  final BuildContext context;
  final Canvas canvas;
  final PlatformTextStyle textStyle;

  const DrawLocusRulerMarker({
    required this.context,
    required this.canvas,
    required this.textStyle,
  });

  void printMarker({
    required String text,
    required double textAlign,
  }) {
    const textHeight = 8.0;

    final textSpan = TextSpan(
      style: textStyle(context).copyWith(
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
