import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/platform_text_style.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_type_enum.dart';
import 'package:flutter/widgets.dart';

import 'draw/draw_locus_line.dart';

class LocusMapDrawLineWidget extends StatelessWidget {
  final double screenWidthScale;
  final int locusLength;
  final double scale;
  final int pixelsPerCharacter;
  final int locusLengthByCharacters;

  const LocusMapDrawLineWidget({
    required this.screenWidthScale,
    required this.locusLength,
    required this.scale,
    required this.pixelsPerCharacter,
    required this.locusLengthByCharacters,
    super.key,
  });

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: DrawLocusLine(
          width: screenWidthScale,
          locusLength: locusLength,
          scale: scale,
          pixelsPerCharacter: pixelsPerCharacter,
          locusLengthByCharacters: locusLengthByCharacters,
          textStyle: getPlatformTextStyle(context, TextType.subTitle),
        ),
      );
}
