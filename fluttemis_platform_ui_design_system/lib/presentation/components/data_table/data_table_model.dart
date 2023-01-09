import '../platform/text/text_type_enum.dart';

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

  DataTableColumnModel({
    required this.label,
    required this.isNumeric,
  });
}

class DataTableRowModel {
  final String data;
  final TextType textType;

  DataTableRowModel({
    required this.data,
    required this.textType,
  });
}
