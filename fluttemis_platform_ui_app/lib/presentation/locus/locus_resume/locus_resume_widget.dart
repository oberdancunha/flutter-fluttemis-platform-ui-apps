import 'package:fluttemis_platform_ui_core/application/locusShow/locus_show_store.dart';
import 'package:fluttemis_platform_ui_core/domain/locus/locus.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../locus_map/locus_map_widget.dart';
import 'genome_overview_widget.dart';
import 'locus_features_overview_widget.dart';
import 'locus_products_overview_widget.dart';

class LocusResumeWidget extends StatefulWidget {
  final KtList<Locus> locus;

  const LocusResumeWidget({
    required this.locus,
    super.key,
  });

  @override
  State<LocusResumeWidget> createState() => _LocusResumeWidgetState();
}

class _LocusResumeWidgetState extends State<LocusResumeWidget> {
  final locusShowStore = Modular.get<LocusShowStore>();

  @override
  void initState() {
    super.initState();
    locusShowStore.locusToBeShown = widget.locus.get(0);
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: locusShowStore,
        child: Column(
          children: [
            const LocusMapWidget(),
            const SizedBox(height: 15),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GenomeOverviewWidget(locus: locusShowStore.locusToBeShown),
                  LocusFeaturesOverviewWidget(
                    total: locusShowStore.locusToBeShown.features.count(),
                    featuresTypesCount:
                        locusShowStore.locusToBeShown.featuresReport.featuresTypesCount,
                  ),
                  LocusProductsOverviewWidget(
                    featuresTypesProductsCount:
                        locusShowStore.locusToBeShown.featuresReport.featuresTypesProductsCount,
                  ),
                ],
              ),
            ),
          ],
        ),
        builder: (_, locusResumeWidget) => locusResumeWidget!,
      );
}
