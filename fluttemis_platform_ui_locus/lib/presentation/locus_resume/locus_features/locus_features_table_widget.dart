import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/data_table/data_table_model.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/data_table/data_table_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/color/platform_color.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/platform_text_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_style/label_text_style.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/text/text_style/platform_text_style.dart';
import 'package:flutter/widgets.dart';

import '../../../domain/feature/feature.dart';

class LocusFeaturesTableWidget extends StatelessWidget {
  final KtList<Feature> features;

  const LocusFeaturesTableWidget({
    required this.features,
    super.key,
  });

  static const double _fontSize = 13;

  @override
  Widget build(BuildContext context) {
    final fluttemisAppLocalizations = FluttemisAppLocalizations.of(context)!;
    final PlatformTextStyle defaultTextStyle = LabelTextStyle(context);

    return LayoutBuilder(
      builder: (_, constraints) => DataTableWidget(
        hintTextSearch: fluttemisAppLocalizations.featureHintTextSearch,
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
              label: fluttemisAppLocalizations.tblSequenceLength,
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
                      textStyle: defaultTextStyle,
                      fontSize: _fontSize,
                    ),
                    rawData: feature.start,
                  ),
                  DataTableRowModel<int>(
                    dataToShow: PlatformTextWidget(
                      feature.end.toString(),
                      textStyle: defaultTextStyle,
                      fontSize: _fontSize,
                    ),
                    rawData: feature.end,
                  ),
                  DataTableRowModel<int>(
                    dataToShow: PlatformTextWidget(
                      feature.length.toString(),
                      textStyle: defaultTextStyle,
                      fontSize: _fontSize,
                    ),
                    rawData: feature.length,
                  ),
                  DataTableRowModel<String>(
                    dataToShow: PlatformTextWidget(
                      feature.strand.getOrError().label,
                      textStyle: defaultTextStyle,
                      fontSize: _fontSize,
                    ),
                    rawData: feature.strand.getOrError().name,
                  ),
                  DataTableRowModel<String>(
                    dataToShow: PlatformTextWidget(
                      feature.name ?? '-',
                      textStyle: defaultTextStyle,
                      fontSize: _fontSize,
                    ),
                    rawData: feature.name ?? '',
                  ),
                  DataTableRowModel<String>(
                    dataToShow: PlatformTextWidget(
                      feature.type,
                      textStyle: defaultTextStyle,
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
                            textStyle: defaultTextStyle,
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
                            textStyle: defaultTextStyle,
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
        emptyMessage: fluttemisAppLocalizations.emptyFeatureTable,
      ),
    );
  }
}
