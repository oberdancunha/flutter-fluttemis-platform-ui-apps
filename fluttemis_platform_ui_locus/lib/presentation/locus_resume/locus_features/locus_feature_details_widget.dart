import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_style/label_text_style.dart';
import 'package:flutter/widgets.dart';

import '../../../domain/feature/feature.dart';
import 'locus_feature_details_sequences_widget.dart';

class LocusFeatureDetailsWidget extends StatefulWidget {
  final Feature locusFeature;

  const LocusFeatureDetailsWidget({
    required this.locusFeature,
    super.key,
  });

  @override
  State<LocusFeatureDetailsWidget> createState() => _LocusFeatureDetailsWidgetState();
}

class _LocusFeatureDetailsWidgetState extends State<LocusFeatureDetailsWidget> {
  static const _assetsImagesPath = 'assets/images/feature';

  @override
  Widget build(BuildContext context) {
    final fluttemisAppLocalizations = FluttemisAppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (_, constraints) {
        final crossAxisCount = (constraints.maxWidth / 180).ceil();

        return SizedBox(
          height: constraints.maxHeight,
          width: constraints.maxWidth,
          child: Column(
            children: [
              GridView.count(
                crossAxisCount: crossAxisCount > 0 ? crossAxisCount : 1,
                childAspectRatio: 2.5,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  OverviewDataWidget(
                    value: widget.locusFeature.start.toString(),
                    description: fluttemisAppLocalizations.featureStart,
                    image: '$_assetsImagesPath/feature_start.png',
                    textStyle: LabelTextStyle(context),
                  ),
                  OverviewDataWidget(
                    value: widget.locusFeature.end.toString(),
                    description: fluttemisAppLocalizations.featureEnd,
                    image: '$_assetsImagesPath/feature_end.png',
                    textStyle: LabelTextStyle(context),
                  ),
                  OverviewDataWidget(
                    value: widget.locusFeature.length.toString(),
                    description: fluttemisAppLocalizations.featureLength,
                    image: '$_assetsImagesPath/feature_length.png',
                    textStyle: LabelTextStyle(context),
                  ),
                  OverviewDataWidget(
                    value: widget.locusFeature.strand.getOrError().label,
                    description: fluttemisAppLocalizations.featureStrand,
                    image: '$_assetsImagesPath/feature_strand.png',
                    textStyle: LabelTextStyle(context),
                  ),
                  if (widget.locusFeature.name != null)
                    OverviewDataWidget(
                      value: widget.locusFeature.name!,
                      description: fluttemisAppLocalizations.featureName,
                      image: '$_assetsImagesPath/feature_name.png',
                      textStyle: LabelTextStyle(context),
                    ),
                  OverviewDataWidget(
                    value: widget.locusFeature.type,
                    description: fluttemisAppLocalizations.featureType,
                    image: '$_assetsImagesPath/feature_type.png',
                    textStyle: LabelTextStyle(context),
                  ),
                ],
              ),
              if (widget.locusFeature.product != null)
                OverviewDataWidget(
                  value: widget.locusFeature.product!,
                  description: fluttemisAppLocalizations.featureProduct,
                  image: '$_assetsImagesPath/feature_product.png',
                  textStyle: LabelTextStyle(context),
                ),
              if (widget.locusFeature.note != null)
                OverviewDataWidget(
                  value: widget.locusFeature.note!,
                  description: fluttemisAppLocalizations.featureNote,
                  image: '$_assetsImagesPath/feature_note.png',
                  textStyle: LabelTextStyle(context),
                ),
              Expanded(
                child: LocusFeatureDetailsSequencesWidget(
                  locusFeature: widget.locusFeature,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
