import 'package:fluttemis_platform_ui_core/domain/locus/feature.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_sequences_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_type_enum.dart';
import 'package:flutter/widgets.dart';

class LocusFeatureDetailsWidget extends StatelessWidget {
  final Feature locusFeature;

  const LocusFeatureDetailsWidget({
    required this.locusFeature,
    super.key,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) {
          final crossAxisCount = (constraints.maxWidth / 180).ceil();

          return SizedBox(
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GridView.count(
                    crossAxisCount: crossAxisCount > 0 ? crossAxisCount : 1,
                    childAspectRatio: 2.5,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 30),
                    children: [
                      OverviewDataWidget(
                        value: locusFeature.start.toString(),
                        description: FluttemisAppLocalizations.of(context)!.featureStart,
                        image: 'assets/images/feature/feature_start.png',
                        textType: TextType.label,
                      ),
                      OverviewDataWidget(
                        value: locusFeature.end.toString(),
                        description: FluttemisAppLocalizations.of(context)!.featureEnd,
                        image: 'assets/images/feature/feature_end.png',
                        textType: TextType.label,
                      ),
                      OverviewDataWidget(
                        value: locusFeature.strand.label,
                        description: FluttemisAppLocalizations.of(context)!.featureStrand,
                        image: 'assets/images/feature/feature_strand.png',
                        textType: TextType.label,
                      ),
                      if (locusFeature.name != null)
                        OverviewDataWidget(
                          value: locusFeature.name!,
                          description: FluttemisAppLocalizations.of(context)!.featureName,
                          image: 'assets/images/feature/feature_name.png',
                          textType: TextType.label,
                        ),
                    ],
                  ),
                  if (locusFeature.product != null)
                    OverviewDataWidget(
                      value: locusFeature.product!,
                      description: FluttemisAppLocalizations.of(context)!.featureProduct,
                      image: 'assets/images/feature/feature_product.png',
                      textType: TextType.label,
                    ),
                  if (locusFeature.note != null)
                    OverviewDataWidget(
                      value: locusFeature.note!,
                      description: FluttemisAppLocalizations.of(context)!.featureNote,
                      image: 'assets/images/feature/feature_note.png',
                      textType: TextType.label,
                    ),
                  if (locusFeature.nucleotides != null) ...[
                    const SizedBox(height: 10),
                    OverviewDataSequencesWidget(
                      title: FluttemisAppLocalizations.of(context)!.nucleotideSequence,
                      sequences: locusFeature.nucleotides!,
                    ),
                  ],
                  if (locusFeature.aminoacids != null) ...[
                    const SizedBox(height: 20),
                    OverviewDataSequencesWidget(
                      title: FluttemisAppLocalizations.of(context)!.aminoacidSequence,
                      sequences: locusFeature.aminoacids!,
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      );
}
