import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/card/platform_card_widget.dart';
import 'package:flutter/widgets.dart';

import 'locus_map_product_label_widget.dart';

class LocusMapWidget extends StatelessWidget {
  const LocusMapWidget({super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width * 0.98,
          child: PlatformCardWidget(
            child: Column(
              children: const [
                SizedBox(
                  height: 90,
                  child: LocusMapProductLabelWidget(),
                ),
              ],
            ),
          ),
        ),
      );
}
