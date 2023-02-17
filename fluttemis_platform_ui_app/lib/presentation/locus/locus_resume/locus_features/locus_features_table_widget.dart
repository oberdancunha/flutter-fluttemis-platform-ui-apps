import 'package:fluttemis_platform_ui_core/domain/locus/feature.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/data_table/data_table_model.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/data_table/data_table_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/color/platform_color.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/platform_text_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_type_enum.dart';
import 'package:flutter/widgets.dart';

class LocusFeaturesTableWidget extends StatelessWidget {
  final KtList<Feature> features;

  const LocusFeaturesTableWidget({
    required this.features,
    super.key,
  });

  static const double _fontSize = 13;
  static const TextType _defaultTextType = TextType.label;

  @override
  Widget build(BuildContext context) {
    final fluttemisAppLocalizations = FluttemisAppLocalizations.of(context)!;

    return LayoutBuilder(
      builder: (_, constraints) => DataTableWidget(
        hintTextSearch: fluttemisAppLocalizations.featuresHintTextSearch,
        dataTableModel: DataTableModel(
          columns: [
            DataTableColumnModel(
              label: fluttemisAppLocalizations.tblStart,
              isNumeric: true,
              isSortable: true,
            ),
            DataTableColumnModel(
              label: fluttemisAppLocalizations.featureEnd,
              isNumeric: true,
              isSortable: true,
            ),
            DataTableColumnModel(
              label: fluttemisAppLocalizations.tblSequencesLength,
              isNumeric: true,
              isSortable: true,
            ),
            DataTableColumnModel(
              label: fluttemisAppLocalizations.featureStrand,
              isNumeric: false,
              isSortable: true,
            ),
            DataTableColumnModel(
              label: fluttemisAppLocalizations.featureName,
              isNumeric: false,
              isSortable: true,
            ),
            DataTableColumnModel(
              label: fluttemisAppLocalizations.featureType,
              isNumeric: false,
              isSortable: true,
            ),
            DataTableColumnModel(
              label: fluttemisAppLocalizations.featureProduct,
              isNumeric: false,
              isSortable: true,
              width: constraints.maxWidth * 0.15,
            ),
            DataTableColumnModel(
              label: fluttemisAppLocalizations.tblNote,
              isNumeric: false,
              isSortable: true,
              width: constraints.maxWidth * 0.15,
            ),
          ],
          data: features
              .toMutableList()
              .sortedBy((feature) => feature.start)
              .filter((feature) => feature.show)
              .map(
                (feature) => [
                  DataTableRowModel<int>(
                    dataToShow: PlatformTextWidget(
                      feature.start.toString(),
                      textType: _defaultTextType,
                      fontSize: _fontSize,
                    ),
                    rawData: feature.start,
                  ),
                  DataTableRowModel<int>(
                    dataToShow: PlatformTextWidget(
                      feature.end.toString(),
                      textType: _defaultTextType,
                      fontSize: _fontSize,
                    ),
                    rawData: feature.end,
                  ),
                  DataTableRowModel<int>(
                    dataToShow: PlatformTextWidget(
                      feature.length.toString(),
                      textType: _defaultTextType,
                      fontSize: _fontSize,
                    ),
                    rawData: feature.length,
                  ),
                  DataTableRowModel<String>(
                    dataToShow: PlatformTextWidget(
                      feature.strand.label,
                      textType: _defaultTextType,
                      fontSize: _fontSize,
                    ),
                    rawData: feature.strand.name,
                  ),
                  DataTableRowModel<String>(
                    dataToShow: PlatformTextWidget(
                      feature.name ?? '-',
                      textType: _defaultTextType,
                      fontSize: _fontSize,
                    ),
                    rawData: feature.name ?? '',
                  ),
                  DataTableRowModel<String>(
                    dataToShow: PlatformTextWidget(
                      feature.type,
                      textType: _defaultTextType,
                      fontSize: _fontSize,
                    ),
                    rawData: feature.type,
                  ),
                  DataTableRowModel<String>(
                    dataToShow: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                        child: SingleChildScrollView(
                          child: PlatformTextWidget(
                            feature.product ?? '-',
                            textType: _defaultTextType,
                            fontSize: _fontSize,
                            color: getPlatformColor(feature.productType.color),
                          ),
                        ),
                      ),
                    ),
                    rawData: feature.product ?? '-',
                  ),
                  DataTableRowModel<String>(
                    dataToShow: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                        child: SingleChildScrollView(
                          child: PlatformTextWidget(
                            feature.note ?? '-',
                            textType: _defaultTextType,
                            fontSize: _fontSize,
                          ),
                        ),
                      ),
                    ),
                    rawData: feature.note,
                  ),
                ],
              )
              .asList(),
        ),
        emptyMessage: fluttemisAppLocalizations.emptyFeaturesTable,
      ),
    );
  }
}
