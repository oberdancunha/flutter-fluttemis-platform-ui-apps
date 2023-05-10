import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/draw_ruler_color/platform_draw_ruler_color.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_style/sub_title_text_style.dart';
import 'package:flutter/widgets.dart';

import 'draw/draw_locus_ruler.dart';

class LocusMapDrawRulerWidget extends StatelessWidget {
  final double height;
  final double widthMapArea;
  final int locusLength;
  final double scale;
  final int pixelsPerCharacter;
  final int locusLengthByCharacters;
  final ScrollController scrollControllerRulerFeatures;

  const LocusMapDrawRulerWidget({
    required this.height,
    required this.widthMapArea,
    required this.locusLength,
    required this.scale,
    required this.pixelsPerCharacter,
    required this.locusLengthByCharacters,
    required this.scrollControllerRulerFeatures,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Positioned(
        left: 125,
        bottom: 0,
        top: 0,
        right: 20,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            controller: scrollControllerRulerFeatures,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            child: SingleChildScrollView(
              child: SizedBox(
                width: widthMapArea,
                height: height,
                child: CustomPaint(
                  isComplex: true,
                  painter: DrawLocusRuler(
                    color: PlatformDrawRulerColor(context)(),
                    widthMapArea: widthMapArea,
                    locusLength: locusLength,
                    scale: scale,
                    pixelsPerCharacter: pixelsPerCharacter,
                    locusLengthByCharacters: locusLengthByCharacters,
                    textStyle: SubTitleTextStyle(context),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}
