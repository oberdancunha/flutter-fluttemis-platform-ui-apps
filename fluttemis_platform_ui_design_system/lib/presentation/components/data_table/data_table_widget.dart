import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/material.dart';

import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';
import 'data_table_model.dart';

class DataTableWidget extends StatelessWidget {
  final DataTableModel dataTableModel;

  const DataTableWidget({
    required this.dataTableModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Material(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: DataTable2(
            columnSpacing: 12,
            horizontalMargin: 12,
            columns: dataTableModel.columns
                .map(
                  (column) => DataColumn2(
                    label: PlatformTextWidget(
                      column.label,
                      textType: TextType.title,
                      fontSize: 15,
                    ),
                    numeric: column.isNumeric,
                  ),
                )
                .toList(),
            rows: List<DataRow>.generate(
              dataTableModel.data.length,
              (index) => DataRow(
                cells: dataTableModel.data
                    .elementAt(index)
                    .map(
                      (row) => DataCell(
                        PlatformTextWidget(
                          row.data,
                          textType: row.textType,
                          fontSize: 13,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      );
}
