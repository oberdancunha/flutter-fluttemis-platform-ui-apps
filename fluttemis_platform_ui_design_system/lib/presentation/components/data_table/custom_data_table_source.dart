import 'package:flutter/material.dart';

import 'data_table_model.dart';

class CustomDataTableSource extends DataTableSource {
  final List<List<DataTableRowModel>> listData;

  CustomDataTableSource({
    required this.listData,
  });

  @override
  DataRow? getRow(int index) {
    final rowData = listData.elementAt(index);

    return DataRow.byIndex(
      index: index,
      cells: rowData
          .map(
            (row) => DataCell(row.dataToShow),
          )
          .toList(),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => listData.length;

  @override
  int get selectedRowCount => 0;
}
