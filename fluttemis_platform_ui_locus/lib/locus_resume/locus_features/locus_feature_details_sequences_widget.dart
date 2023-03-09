import 'package:fluttemis_platform_ui_core/domain/locus/feature.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_sequences/overview_data_sequences_widget.dart';
import 'package:flutter/widgets.dart';

class LocusFeatureDetailsSequencesWidget extends StatefulWidget {
  final Feature locusFeature;

  const LocusFeatureDetailsSequencesWidget({
    required this.locusFeature,
    super.key,
  });

  @override
  State<LocusFeatureDetailsSequencesWidget> createState() =>
      _LocusFeatureDetailsSequencesWidgetState();
}

class _LocusFeatureDetailsSequencesWidgetState extends State<LocusFeatureDetailsSequencesWidget> {
  static const _pixelsPerBase = 15;

  double _getHeight(int sequenceLength, int sequencesPerLine, double maxHeightBySquenceType) {
    final numberRowsSequences = (sequenceLength / sequencesPerLine).ceil() + 3;
    final minHeight = (_pixelsPerBase * numberRowsSequences).toDouble();
    if (minHeight <= maxHeightBySquenceType) {
      return minHeight;
    }

    return maxHeightBySquenceType;
  }

  double _getNucleotidesMaxHeight(double maxHeightScreen) =>
      widget.locusFeature.aminoacids != null ? maxHeightScreen * 0.45 : maxHeightScreen * 0.85;

  double _getAminoacidsMaxHeight(double maxHeightScreen) => maxHeightScreen * 0.29;

  @override
  Widget build(BuildContext context) {
    final fluttemisAppLocalizations = FluttemisAppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (_, constraints) {
        final sequencesPerLine = ((constraints.maxWidth / 7.1) / 2).ceil();

        return Column(
          children: [
            if (widget.locusFeature.nucleotides != null) ...[
              const SizedBox(height: 10),
              OverviewDataSequencesWidget(
                height: _getHeight(
                  widget.locusFeature.nucleotides!.length,
                  sequencesPerLine,
                  _getNucleotidesMaxHeight(constraints.maxHeight),
                ),
                title: fluttemisAppLocalizations.nucleotideSequence,
                sequences: widget.locusFeature.nucleotides!,
              ),
            ],
            if (widget.locusFeature.aminoacids != null) ...[
              const SizedBox(height: 5),
              OverviewDataSequencesWidget(
                height: _getHeight(
                  widget.locusFeature.aminoacids!.length,
                  sequencesPerLine,
                  _getAminoacidsMaxHeight(constraints.maxHeight),
                ),
                title: fluttemisAppLocalizations.aminoacidSequence,
                sequences: widget.locusFeature.aminoacids!,
              ),
            ],
          ],
        );
      },
    );
  }
}
