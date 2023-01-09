import 'package:fluttemis_platform_ui_core/domain/locus/locus.dart';
import 'package:fluttemis_platform_ui_core/utils/custom_date_format.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/data_table/data_table_model.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/data_table/data_table_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_type_enum.dart';
import 'package:flutter/widgets.dart';

class LocusTableWidget extends StatelessWidget {
  final KtList<Locus> locus;

  const LocusTableWidget({
    required this.locus,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fluttemisAppLocalizations = FluttemisAppLocalizations.of(context)!;

    return DataTableWidget(
      dataTableModel: DataTableModel(
        columns: [
          DataTableColumnModel(
            label: fluttemisAppLocalizations.tblGenomeName,
            isNumeric: false,
          ),
          DataTableColumnModel(
            label: fluttemisAppLocalizations.tblGenomeCodeAccession,
            isNumeric: false,
          ),
          DataTableColumnModel(
            label: fluttemisAppLocalizations.tblGenomeLength,
            isNumeric: true,
          ),
          DataTableColumnModel(
            label: fluttemisAppLocalizations.tblTotalFeatures,
            isNumeric: true,
          ),
          DataTableColumnModel(
            label: fluttemisAppLocalizations.tblAnnotationDate,
            isNumeric: false,
          ),
        ],
        data: locus
            .toMutableList()
            .map(
              (locus) => [
                DataTableRowModel(
                  data: locus.organism,
                  textType: TextType.genomeName,
                ),
                DataTableRowModel(
                  data: locus.name,
                  textType: TextType.label,
                ),
                DataTableRowModel(
                  data: locus.length.toString(),
                  textType: TextType.label,
                ),
                DataTableRowModel(
                  data: locus.features.size.toString(),
                  textType: TextType.label,
                ),
                DataTableRowModel(
                  data: CustomDateFormat.fromyMdToyMMMMd(
                    FluttemisAppLocalizations.of(context)!.localeName,
                    locus.releaseDate!,
                  ).dateFormatted,
                  textType: TextType.label,
                ),
              ],
            )
            .asList(),
      ),
    );
  }
}
