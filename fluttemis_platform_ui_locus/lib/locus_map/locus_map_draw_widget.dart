import 'package:fluttemis_platform_ui_core/domain/locus/locus.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import 'locus_map_calculate_area_controller.dart';
import 'locus_map_draw_features_widget.dart';
import 'locus_map_draw_ruler_widget.dart';
import 'locus_map_features_label_widget.dart';

class LocusMapDrawWidget extends StatefulWidget {
  final Locus locus;
  final LocusMapCalculateAreaController calculateAreaController;

  const LocusMapDrawWidget({
    required this.locus,
    required this.calculateAreaController,
    super.key,
  });

  @override
  State<LocusMapDrawWidget> createState() => _LocusMapDrawWidgetState();
}

class _LocusMapDrawWidgetState extends State<LocusMapDrawWidget> {
  late LinkedScrollControllerGroup _scrollControllerRulerGroup;
  late ScrollController _scrollControllerRuler;
  late ScrollController _scrollControllerRulerFeatures;
  late LinkedScrollControllerGroup _scrollControllerTypesGroup;
  late ScrollController _scrollControllerLabels;
  late ScrollController _scrollControllerTypesFeatures;
  late LocusMapCalculateAreaController _calculateAreaController;
  late double _height;

  @override
  void initState() {
    super.initState();
    _scrollControllerRulerGroup = LinkedScrollControllerGroup();
    _scrollControllerRuler = _scrollControllerRulerGroup.addAndGet();
    _scrollControllerRulerFeatures = _scrollControllerRulerGroup.addAndGet();
    _scrollControllerTypesGroup = LinkedScrollControllerGroup();
    _scrollControllerLabels = _scrollControllerTypesGroup.addAndGet();
    _scrollControllerTypesFeatures = _scrollControllerTypesGroup.addAndGet();
    _calculateAreaController = widget.calculateAreaController;
    _height = _calculateAreaController.totalFeaturesTypesHeight + 10;
  }

  @override
  void dispose() {
    _scrollControllerRuler.dispose();
    _scrollControllerRulerFeatures.dispose();
    _scrollControllerLabels.dispose();
    _scrollControllerTypesFeatures.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        key: ObjectKey(widget.locus.hashCode),
        width: _calculateAreaController.screenWidthScale,
        child: Stack(
          children: [
            LocusMapDrawRulerWidget(
              height: widget.calculateAreaController.locusRulerHeight,
              widthMapArea: _calculateAreaController.screenWidthScale,
              locusLength: widget.locus.length,
              scale: _calculateAreaController.scale,
              pixelsPerCharacter: _calculateAreaController.pixelsPerCharacter,
              locusLengthByCharacters: _calculateAreaController.locusLengthByCharacters,
              scrollControllerRulerFeatures: _scrollControllerRuler,
            ),
            LocusMapFeaturesLabelWidget(
              height: _height,
              featuresLabel: widget.locus.featuresReport.featuresTypesList.keys.toList(),
              featuresTypesCount: widget.locus.featuresReport.featuresTypesCount,
              nextLine: _calculateAreaController.distanceBetweenLines,
              scrollControllerLabelsFeatures: _scrollControllerLabels,
            ),
            LocusMapDrawFeaturesWidget(
              height: _height,
              widthMapArea: _calculateAreaController.screenWidthScale,
              locusFeaturesTypes: widget.locus.featuresReport.featuresTypesList.values.toList(),
              scale: _calculateAreaController.scale,
              nextLine: _calculateAreaController.distanceBetweenLines,
              scrollControllerRulerFeatures: _scrollControllerRulerFeatures,
              scrollControllerTypesFeatures: _scrollControllerTypesFeatures,
            ),
          ],
        ),
      );
}
