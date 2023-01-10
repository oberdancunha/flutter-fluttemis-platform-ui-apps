import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/material.dart';

import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';
import 'custom_data_table_source.dart';
import 'data_table_model.dart';

class DataTableWidget extends StatefulWidget {
  final DataTableModel dataTableModel;

  const DataTableWidget({
    required this.dataTableModel,
    super.key,
  });

  @override
  State<DataTableWidget> createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  late ScrollController _scrollController;
  late int _sortColumnIndex;
  late bool _sortAscending;
  late List<List<DataTableRowModel>> _listData;
  static const _maxRowsPerPage = 12;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _sortColumnIndex = 0;
    _sortAscending = true;
    _listData = widget.dataTableModel.data;
  }

  @override
  Widget build(BuildContext context) => Material(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: PaginatedDataTable2(
            scrollController: _scrollController,
            columnSpacing: 12,
            horizontalMargin: 12,
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAscending,
            rowsPerPage: widget.dataTableModel.data.length < _maxRowsPerPage
                ? widget.dataTableModel.data.length
                : _maxRowsPerPage,
            columns: widget.dataTableModel.columns
                .map(
                  (column) => DataColumn2(
                    label: PlatformTextWidget(
                      column.label,
                      textType: TextType.title,
                      fontSize: 15,
                    ),
                    numeric: column.isNumeric,
                    onSort: column.isSortable
                        ? (columnIndex, ascending) {
                            column.isNumeric
                                ? _sort<num>(
                                    columnIndex,
                                    ascending,
                                  )
                                : _sort<String>(
                                    columnIndex,
                                    ascending,
                                  );
                          }
                        : null,
                  ),
                )
                .toList(),
            source: CustomDataTableSource(listData: _listData),
          ),
        ),
      );

  void _sort<T>(int columnIndex, bool ascending) {
    _listData.sort(
      (listDataA, listDataB) {
        var dataA = listDataA.elementAt(columnIndex);
        var dataB = listDataB.elementAt(columnIndex);
        if (!ascending) {
          final auxDataA = dataA;
          dataA = dataB;
          dataB = auxDataA;
        }

        final Comparable<T> comparableDataA = dataA.rawData as Comparable<T>;
        final Comparable<T> comparableDataB = dataB.rawData as Comparable<T>;

        return Comparable.compare(comparableDataA, comparableDataB);
      },
    );
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }
}
