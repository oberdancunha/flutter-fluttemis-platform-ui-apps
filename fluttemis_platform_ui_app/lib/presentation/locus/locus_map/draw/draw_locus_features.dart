import 'package:fluttemis_platform_ui_core/domain/locus/feature.dart';
import 'package:fluttemis_platform_ui_core/domain/locus/feature_strand.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/color/platform_color.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/dialog/platform_dialog_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/show_dialog/platform_show_dialog.dart';
import 'package:flutter/widgets.dart';

import '../../locus_resume/locus_feature_details_wdget.dart';
import 'draw_locus_features_arrow.dart';
import 'draw_locus_features_line.dart';

class DrawLocusFeatures extends CustomPainter {
  final BuildContext context;
  final double widthMapArea;
  final List<Feature> locusFeatures;
  final double scale;

  DrawLocusFeatures({
    required this.context,
    required this.widthMapArea,
    required this.locusFeatures,
    required this.scale,
  });

  static const minimalLengthToDrawAdjust = 10;
  static const adjustArrowLigature = 1;

  @override
  void paint(Canvas canvas, Size size) {
    final touchyCanvas = TouchyCanvas(context, canvas);
    locusFeatures.forEach((locusFeature) {
      final paint = Paint()..color = getPlatformColor(locusFeature.color);
      final featureStart = locusFeature.start * scale;
      final featureEnd = locusFeature.end * scale;
      final onTapUp = (_) {
        platformShowDialog(
          context: context,
          builder: (_) => PlatformDialogWidget(
            child: LocusFeatureDetailsWidget(locusFeature: locusFeature),
          ),
        );
      };
      if ((featureEnd - featureStart) + 1 > minimalLengthToDrawAdjust ||
          locusFeature.product != null) {
        _drawLine(
          touchyCanvas,
          paint,
          featureStart: featureStart,
          featureEnd: featureEnd,
          featureStrand: locusFeature.strand,
          onTapUp: onTapUp,
        );
        _drawArrow(
          touchyCanvas,
          paint,
          featureStart: featureStart,
          featureEnd: featureEnd,
          featureStrand: locusFeature.strand,
          onTapUp: onTapUp,
        );
      } else {
        _drawSmallFeature(
          touchyCanvas,
          paint,
          featureEnd: featureEnd,
          onTapUp: onTapUp,
        );
      }
    });
  }

  void _drawLine(
    TouchyCanvas touchyCanvas,
    Paint paint, {
    required double featureStart,
    required double featureEnd,
    required FeatureStrandType featureStrand,
    required Function(TapUpDetails) onTapUp,
  }) {
    final drawLocusFeatureLine = DrawLocusFeatureLine(
      featureStart: featureStart,
      featureEnd: featureEnd,
      featureStrand: featureStrand,
      minimalLengthToDrawAdjust: minimalLengthToDrawAdjust,
      adjustArrowLigature: adjustArrowLigature,
    );
    final drawLine = drawLocusFeatureLine.draw();
    touchyCanvas.drawRRect(
      drawLine,
      paint,
      onTapUp: onTapUp,
    );
  }

  void _drawArrow(
    TouchyCanvas touchyCanvas,
    Paint paint, {
    required double featureStart,
    required double featureEnd,
    required FeatureStrandType featureStrand,
    required Function(TapUpDetails) onTapUp,
  }) {
    final drawLocusFeatureArrow = DrawLocusFeatureArrow(
      featureStart: featureStart,
      featureEnd: featureEnd,
      featureStrand: featureStrand,
    );
    final path = drawLocusFeatureArrow.draw();
    touchyCanvas.drawPath(
      path,
      paint,
      onTapUp: onTapUp,
    );
  }

  void _drawSmallFeature(
    TouchyCanvas touchyCanvas,
    Paint paint, {
    required double featureEnd,
    required Function(TapUpDetails) onTapUp,
  }) {
    final center = Offset(featureEnd, 0);
    paint.strokeWidth = 1;
    touchyCanvas.drawLine(
      Offset(center.dx, center.dy + 7),
      Offset(center.dx, center.dy - 7),
      paint,
      onTapUp: onTapUp,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
