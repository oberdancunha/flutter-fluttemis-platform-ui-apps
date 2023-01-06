import 'package:fluttemis_platform_ui_core/domain/locus/locus.dart';
import 'package:fluttemis_platform_ui_core/utils/custom_date_format.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_list_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/overview_data/overview_data_model.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_type_enum.dart';
import 'package:flutter/widgets.dart';

class GenomeOverviewWidget extends StatelessWidget {
  final Locus locus;

  const GenomeOverviewWidget({
    required this.locus,
    super.key,
  });

  @override
  Widget build(BuildContext context) => OverviewDataListWidget(
        title: FluttemisAppLocalizations.of(context)!.genomeOverview,
        listOverviewData: [
          OverviewDataModel(
            value: locus.organism,
            description: FluttemisAppLocalizations.of(context)!.genomeName,
            image: 'assets/images/data/genome_name.png',
            textType: TextType.genomeName,
          ),
          OverviewDataModel(
            value: locus.name,
            description: FluttemisAppLocalizations.of(context)!.genomeCodeAccession,
            image: 'assets/images/data/genome_code.png',
          ),
          OverviewDataModel(
            value: locus.length.toString(),
            description: FluttemisAppLocalizations.of(context)!.genomeLength,
            image: 'assets/images/data/dna.png',
          ),
          OverviewDataModel(
            value: locus.type,
            description: FluttemisAppLocalizations.of(context)!.genomeType,
            image: 'assets/images/data/genome_type.png',
          ),
          if (locus.shape != null)
            OverviewDataModel(
              value: locus.shape!,
              description: FluttemisAppLocalizations.of(context)!.genomeShape,
              image: 'assets/images/data/genome_shape.png',
            ),
          if (locus.releaseDate != null)
            OverviewDataModel(
              value: DateFormat.yMMMMd(FluttemisAppLocalizations.of(context)!.localeName).format(
                DateTime.parse(
                  CustomDateFormat.yMd(locus.releaseDate!).dateFormatted,
                ),
              ),
              description: FluttemisAppLocalizations.of(context)!.annotationDate,
              image: 'assets/images/data/genome_date.png',
            ),
        ],
      );
}
