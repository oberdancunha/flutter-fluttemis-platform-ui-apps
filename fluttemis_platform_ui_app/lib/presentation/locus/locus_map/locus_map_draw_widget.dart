import 'package:fluttemis_platform_ui_core/domain/locus/locus.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import 'locus_map_calculate_area_controller.dart';
import 'locus_map_draw_features_widget.dart';
import 'locus_map_draw_ruler_widget.dart';
import 'locus_map_features_label_widget.dart';

class LocusMapDrawWidget extends StatefulWidget {
  final Locus locus;

  const LocusMapDrawWidget({
    required this.locus,
    super.key,
  });

  @override
  State<LocusMapDrawWidget> createState() => _LocusMapDrawWidgetState();
}

class _LocusMapDrawWidgetState extends State<LocusMapDrawWidget> {
  static const _minimalWidth = 1200;
  late LinkedScrollControllerGroup _scrollControllerRulerFeatures;
  late ScrollController _scrollControllerRuler;
  late ScrollController _scrollControllerRFeatures;
  late LinkedScrollControllerGroup _scrollControllerLabelsFeatures;
  late ScrollController _scrollControllerLabels;
  late ScrollController _scrollControllerLFeatures;
  static const _nextLine = 20;
  static const _adjustLabelsFeaturesHeight = 15;

  @override
  void initState() {
    super.initState();
    _scrollControllerRulerFeatures = LinkedScrollControllerGroup();
    _scrollControllerRuler = _scrollControllerRulerFeatures.addAndGet();
    _scrollControllerRFeatures = _scrollControllerRulerFeatures.addAndGet();
    _scrollControllerLabelsFeatures = LinkedScrollControllerGroup();
    _scrollControllerLabels = _scrollControllerLabelsFeatures.addAndGet();
    _scrollControllerLFeatures = _scrollControllerLabelsFeatures.addAndGet();
  }

  @override
  void dispose() {
    _scrollControllerRuler.dispose();
    _scrollControllerRFeatures.dispose();
    _scrollControllerLabels.dispose();
    _scrollControllerLFeatures.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) {
          final calculateAreaController = LocusMapCalculateAreaController(
            height: constraints.maxHeight - _adjustLabelsFeaturesHeight,
            width: constraints.maxWidth > _minimalWidth
                ? constraints.maxWidth
                : constraints.maxWidth * 4,
            locusLength: widget.locus.length,
            minPixelsPerCharacter: 10,
            featuresTypesListLength: widget.locus.featuresReport.featuresTypesList.keys.length,
          );
          final screenWidthScale = calculateAreaController.screenWidthScale;
          final scale = calculateAreaController.scale;
          final pixelsPerCharacter = calculateAreaController.pixelsPerCharacter;
          final locusLengthByCharacters = calculateAreaController.locusLengthByCharacters;
          final height = calculateAreaController.mapHeight;

          return SizedBox(
            key: ObjectKey(widget.locus.hashCode),
            height: height,
            width: screenWidthScale,
            child: Stack(
              children: [
                LocusMapDrawRulerWidget(
                  height: height,
                  widthMapArea: screenWidthScale,
                  locusLength: widget.locus.length,
                  scale: scale,
                  pixelsPerCharacter: pixelsPerCharacter,
                  locusLengthByCharacters: locusLengthByCharacters,
                  scrollControllerRulerFeatures: _scrollControllerRuler,
                ),
                LocusMapFeaturesLabelWidget(
                  height: height,
                  featuresLabel: widget.locus.featuresReport.featuresTypesList.keys.toList(),
                  featuresTypesCount: widget.locus.featuresReport.featuresTypesCount,
                  nextLine: _nextLine,
                  scrollControllerLabelsFeatures: _scrollControllerLabels,
                ),
                LocusMapDrawFeaturesWidget(
                  height: height,
                  widthMapArea: screenWidthScale,
                  featuresTypes: widget.locus.featuresReport.featuresTypesList.values.toList(),
                  scale: scale,
                  nextLine: _nextLine,
                  scrollControllerRulerFeatures: _scrollControllerRFeatures,
                  scrollControllerLabelsFeatures: _scrollControllerLFeatures,
                ),
              ],
            ),
          );
        },
      );
}
