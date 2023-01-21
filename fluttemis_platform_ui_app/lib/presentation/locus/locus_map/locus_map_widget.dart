import 'package:fluttemis_platform_ui_core/domain/locus/locus.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/card/platform_card_widget.dart';
import 'package:flutter/material.dart';

import 'locus_map_draw_widget.dart';
import 'locus_map_product_label_widget.dart';

class LocusMapWidget extends StatelessWidget {
  final Locus locus;

  const LocusMapWidget({
    required this.locus,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width * 0.99,
          child: PlatformCardWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 78,
                  child: LocusMapProductLabelWidget(),
                ),
                Expanded(child: LocusMapDrawWidget(locus: locus)),
              ],
            ),
          ),
        ),
      );
}
