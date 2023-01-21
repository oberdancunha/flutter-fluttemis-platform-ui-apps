import 'package:fluttemis_platform_ui_core/domain/locus/locus.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/scrollbar/platform_scrollbar_widget.dart';
import 'package:flutter/widgets.dart';

import 'locus_map_calculate_area_controller.dart';
import 'locus_map_draw_line_widget.dart';

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
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) {
          final calculateAreaController = LocusMapCalculateAreaController(
            height: constraints.maxHeight,
            width: constraints.maxWidth > _minimalWidth
                ? constraints.maxWidth
                : constraints.maxWidth * 4,
            locusLength: widget.locus.length,
            minPixelsPerCharacter: 10,
          );
          final height = calculateAreaController.height;
          final screenWidthScale = calculateAreaController.screenWidthScale;
          final scale = calculateAreaController.scale;
          final pixelsPerCharacter = calculateAreaController.pixelsPerCharacter;
          final locusLengthByCharacters = calculateAreaController.locusLengthByCharacters;

          return PlatformScrollbarWidget(
            controller: _scrollController,
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: height,
                width: screenWidthScale,
                child: LocusMapDrawLineWidget(
                  screenWidthScale: screenWidthScale,
                  locusLength: widget.locus.length,
                  scale: scale,
                  pixelsPerCharacter: pixelsPerCharacter,
                  locusLengthByCharacters: locusLengthByCharacters,
                ),
              ),
            ),
          );
        },
      );
}
