import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/material.dart';

import '../platform/icon/icon_type_enum.dart';
import '../platform/icon/platform_icon.dart';
import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';
import 'custom_data_table_source.dart';
import 'data_table_controller.dart';
import 'data_table_empty_message_widget.dart';
import 'data_table_header_widget.dart';
import 'data_table_model.dart';

class DataTableWidget extends StatefulWidget {
  final DataTableModel dataTableModel;
  final String hintTextSearch;
  final String emptyMessage;

  const DataTableWidget({
    required this.dataTableModel,
    required this.hintTextSearch,
    required this.emptyMessage,
    super.key,
  });

  @override
  State<DataTableWidget> createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  late DataTableController _dataTableController;
  late PaginatorController _paginatorController;
  late int _sortColumnIndex;
  late bool _sortAscending;
  late int _historySortColumnIndex;
  late bool _historySortAscending;
  late List<List<DataTableRowModel>> _listData;
  late List<List<DataTableRowModel>> _historyListData;

  @override
  void initState() {
    super.initState();
    _dataTableController = DataTableController();
    _paginatorController = PaginatorController();
    _sortColumnIndex = 0;
    _sortAscending = true;
    _historySortColumnIndex = 0;
    _historySortAscending = true;
    _listData = widget.dataTableModel.data;
    _historyListData = widget.dataTableModel.data;
  }

  @override
  void dispose() {
    _paginatorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: PaginatedDataTable2(
          wrapInCard: false,
          columnSpacing: 12,
          horizontalMargin: 12,
          autoRowsToHeight: true,
          renderEmptyRowsInTheEnd: false,
          showFirstLastButtons: true,
          headingRowColor: MaterialStateProperty.all(Colors.transparent),
          controller: _paginatorController,
          empty: DataTableEmptyMessageWidget(message: widget.emptyMessage),
          header: DataTableHeaderWidget(
            onChanged: _changeTextSearch,
            onClear: _clear,
            hintTextSearch: widget.hintTextSearch,
          ),
          sortArrowIcon: getPlatformIcon(IconType.arrow),
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _sortAscending,
          columns: _buildColumns(),
          source: CustomDataTableSource(listData: _listData),
          hidePaginator: _listData.isEmpty,
          dividerThickness: _listData.isEmpty ? 0 : 1,
        ),
      );

  void _changeTextSearch(String textSearch) {
    setState(() {
      _listData = _dataTableController.changeTextSearch(
        originalListData: _historyListData,
        textSearch: textSearch,
      );
      _paginatorController.goToFirstPage();
      if (_listData.isEmpty) {
        _sortColumnIndex = 0;
        _sortAscending = true;
      } else {
        _recoverySortStatusHistory();
      }
    });
  }

  List<DataColumn> _buildColumns() => _listData.isEmpty
      ? [
          const DataColumn2(
            label: Text(""),
          ),
        ]
      : widget.dataTableModel.columns
          .map(
            (column) => DataColumn2(
              label: PlatformTextWidget(
                column.label,
                textType: TextType.title,
                fontSize: 14,
              ),
              numeric: column.isNumeric,
              onSort: column.isSortable
                  ? (columnIndex, ascending) {
                      _listData = column.isNumeric
                          ? _dataTableController.sort<num>(
                              listData: _listData,
                              columnIndex: columnIndex,
                              ascending: ascending,
                              updateState: () => setState(() {
                                _sortColumnIndex = columnIndex;
                                _sortAscending = ascending;
                              }),
                            )
                          : _dataTableController.sort<String>(
                              listData: _listData,
                              columnIndex: columnIndex,
                              ascending: ascending,
                              updateState: () => setState(() {
                                _sortColumnIndex = columnIndex;
                                _sortAscending = ascending;
                              }),
                            );
                      _historyListData = _listData;
                      _historySortColumnIndex = _sortColumnIndex;
                      _historySortAscending = _sortAscending;
                    }
                  : null,
              fixedWidth: column.width,
            ),
          )
          .toList();

  void _clear() {
    setState(() {
      _listData = _historyListData;
    });
    _recoverySortStatusHistory();
  }

  void _recoverySortStatusHistory() {
    _sortColumnIndex = _historySortColumnIndex;
    _sortAscending = _historySortAscending;
  }
}
