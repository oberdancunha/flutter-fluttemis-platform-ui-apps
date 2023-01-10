import 'package:flutter/widgets.dart';

class DataTableModel {
  final List<DataTableColumnModel> columns;
  final List<List<DataTableRowModel>> data;

  DataTableModel({
    required this.columns,
    required this.data,
  });
}

class DataTableColumnModel {
  final String label;
  final bool isNumeric;
  final bool isSortable;

  DataTableColumnModel({
    required this.label,
    required this.isNumeric,
    required this.isSortable,
  });
}

class DataTableRowModel<T> {
  final Widget dataToShow;
  final T? rawData;

  DataTableRowModel({
    required this.dataToShow,
    this.rawData,
  });
}
