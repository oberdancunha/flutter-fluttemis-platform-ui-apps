import 'package:fluttemis_platform_ui_core/domain/locus/locus.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/card/platform_card_widget.dart';
import 'package:flutter/widgets.dart';

import 'locus_map_calculate_area_controller.dart';
import 'locus_map_draw_widget.dart';
import 'locus_map_no_features_widget.dart';
import 'locus_map_product_label_widget.dart';

class LocusMapWidget extends StatefulWidget {
  final Locus locus;

  const LocusMapWidget({
    required this.locus,
    super.key,
  });

  @override
  State<LocusMapWidget> createState() => _LocusMapWidgetState();
}

class _LocusMapWidgetState extends State<LocusMapWidget> {
  static const _productLabelWidthHeight = 80.0;

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.35;
    final width = MediaQuery.of(context).size.width * 0.99;
    final calculateAreaController = LocusMapCalculateAreaController(
      maxHeight: maxHeight,
      width: width,
      locusLength: widget.locus.length,
      minPixelsPerCharacter: 10,
      featuresTypesListLength: widget.locus.featuresReport.featuresTypesList.keys.length,
      minHeight: 50,
      distanceBetweenLines: 20,
      locusRulerHeight: 25,
    );

    return Center(
      child: SizedBox(
        height: calculateAreaController.mapHeight + _productLabelWidthHeight,
        width: width,
        child: Visibility(
          visible: widget.locus.featuresReport.featuresTypesList.keys.isNotEmpty,
          replacement: const LocusMapNoFeaturesWidget(),
          child: PlatformCardWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: _productLabelWidthHeight,
                  child: LocusMapProductLabelWidget(),
                ),
                Expanded(
                  child: LocusMapDrawWidget(
                    locus: widget.locus,
                    calculateAreaController: calculateAreaController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
