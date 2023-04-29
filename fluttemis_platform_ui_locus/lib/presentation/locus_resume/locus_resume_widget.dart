import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../../application/locusShow/locus_show_store.dart';
import '../../domain/locus/locus.dart';
import '../locus_map/locus_map_widget.dart';
import 'genome_overview_widget.dart';
import 'locus_features/locus_features_overview_widget.dart';
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
  final _locusShowStore = Modular.get<LocusShowStore>();

  @override
  void initState() {
    super.initState();
    _locusShowStore.locusToBeShown = widget.locus.get(0);
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: _locusShowStore,
        builder: (_, __) => Column(
          key: GlobalKey(),
          children: [
            LocusMapWidget(locus: _locusShowStore.locusToBeShown),
            const SizedBox(height: 10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GenomeOverviewWidget(locus: _locusShowStore.locusToBeShown),
                  LocusFeaturesOverviewWidget(
                    features: _locusShowStore.locusToBeShown.features,
                    total: _locusShowStore.locusToBeShown.features.count(),
                    featuresTypesCount:
                        _locusShowStore.locusToBeShown.featuresReport.featuresTypesCount,
                  ),
                  LocusProductsOverviewWidget(
                    totalProductsFeatures:
                        _locusShowStore.locusToBeShown.featuresReport.totalProductsFeatures,
                    featuresTypesProductsCount:
                        _locusShowStore.locusToBeShown.featuresReport.featuresTypesProductsCount,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
