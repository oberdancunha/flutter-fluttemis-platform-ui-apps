import 'package:fluttemis_platform_ui_core/utils/custom_date_format.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/data_table/data_table_model.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/data_table/data_table_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/icon/icon_type_enum.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/icon/platform_icon_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/icon_button/platform_icon_button_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/platform_text_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_type_enum.dart';
import 'package:flutter/widgets.dart';

import '../../application/locusShow/locus_show_store.dart';
import '../../domain/locus/locus.dart';

class LocusTableWidget extends StatelessWidget {
  final KtList<Locus> locus;

  const LocusTableWidget({
    required this.locus,
    super.key,
  });

  static const double _fontSize = 13;
  static const TextType _defaultTextType = TextType.label;

  @override
  Widget build(BuildContext context) {
    final fluttemisAppLocalizations = FluttemisAppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (_, constraints) => DataTableWidget(
        hintTextSearch: fluttemisAppLocalizations.locusHintTextSearch,
        dataTableModel: DataTableModel(
          columns: [
            DataTableColumnModel(
              label: fluttemisAppLocalizations.tblGenomeName,
              isNumeric: false,
              isSortable: true,
              width: constraints.maxWidth * 0.3,
            ),
            DataTableColumnModel(
              label: fluttemisAppLocalizations.tblGenomeCodeAccession,
              isNumeric: false,
              isSortable: true,
              width: constraints.maxWidth * 0.2,
            ),
            DataTableColumnModel(
              label: fluttemisAppLocalizations.tblSequencesLength,
              isNumeric: true,
              isSortable: true,
            ),
            DataTableColumnModel(
              label: fluttemisAppLocalizations.tblTotalFeatures,
              isNumeric: true,
              isSortable: true,
            ),
            DataTableColumnModel(
              label: fluttemisAppLocalizations.tblAnnotationDate,
              isNumeric: false,
              isSortable: true,
            ),
            DataTableColumnModel(
              label: '',
              isNumeric: false,
              isSortable: false,
            ),
          ],
          data: locus.toMutableList().map(
            (locus) {
              final date = CustomDateFormat.fromyMdToyMMMMd(
                fluttemisAppLocalizations.localeName,
                locus.releaseDate!,
              ).dateFormatted;

              final dateToMillisecondsSinceEpoch =
                  CustomDateFormat.fromyMdToMillisecondsSinceEpoch(locus.releaseDate!)
                      .dateFormatted;

              return [
                DataTableRowModel<String>(
                  dataToShow: PlatformTextWidget(
                    locus.organism,
                    textType: TextType.genomeName,
                    fontSize: _fontSize,
                  ),
                  rawData: locus.organism,
                ),
                DataTableRowModel<String>(
                  dataToShow: PlatformTextWidget(
                    locus.name,
                    textType: _defaultTextType,
                    fontSize: _fontSize,
                  ),
                  rawData: locus.name,
                ),
                DataTableRowModel<int>(
                  dataToShow: PlatformTextWidget(
                    locus.length.toString(),
                    textType: _defaultTextType,
                    fontSize: _fontSize,
                  ),
                  rawData: locus.length,
                ),
                DataTableRowModel<int>(
                  dataToShow: PlatformTextWidget(
                    locus.features.size.toString(),
                    textType: _defaultTextType,
                    fontSize: _fontSize,
                  ),
                  rawData: locus.features.size,
                ),
                DataTableRowModel<String>(
                  dataToShow: PlatformTextWidget(
                    date,
                    textType: _defaultTextType,
                    fontSize: _fontSize,
                  ),
                  rawData: date,
                  rawDataToSort: dateToMillisecondsSinceEpoch,
                ),
                DataTableRowModel(
                  dataToShow: SizedBox(
                    height: 25,
                    child: Visibility(
                      visible: context.read<LocusShowStore>().locusToBeShown != locus,
                      replacement: Center(
                        child: PlatformTextWidget(
                          fluttemisAppLocalizations.locusOpened,
                          textType: TextType.title,
                          fontSize: _fontSize,
                        ),
                      ),
                      child: PlatformIconButtonWidget(
                        icon: const PlatformIconWidget(
                          iconType: IconType.change,
                          size: 12,
                        ),
                        label: fluttemisAppLocalizations.openLocus,
                        fontSize: 11,
                        onPressed: () {
                          context.watch<LocusShowStore>().locusToBeShown = locus;
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),
                ),
              ];
            },
          ).asList(),
        ),
        emptyMessage: fluttemisAppLocalizations.emptyLocusTable,
      ),
    );
  }
}
