import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/platform_text_style.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_type_enum.dart';
import 'package:flutter/widgets.dart';

import 'draw/draw_locus_ruler.dart';

class LocusMapDrawRulerWidget extends StatelessWidget {
  final double widthMapArea;
  final int locusLength;
  final double scale;
  final int pixelsPerCharacter;
  final int locusLengthByCharacters;

  const LocusMapDrawRulerWidget({
    required this.widthMapArea,
    required this.locusLength,
    required this.scale,
    required this.pixelsPerCharacter,
    required this.locusLengthByCharacters,
    super.key,
  });

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: DrawLocusRuler(
          widthMapArea: widthMapArea,
          locusLength: locusLength,
          scale: scale,
          pixelsPerCharacter: pixelsPerCharacter,
          locusLengthByCharacters: locusLengthByCharacters,
          textStyle: getPlatformTextStyle(context, TextType.subTitle),
        ),
      );
}
