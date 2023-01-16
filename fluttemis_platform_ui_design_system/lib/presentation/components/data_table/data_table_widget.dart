import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/material.dart';

import '../platform/icon/icon_type_enum.dart';
import '../platform/icon/platform_icon.dart';
import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';
import 'custom_data_table_source.dart';
import 'data_table_controller.dart';
import 'data_table_header_widget.dart';
import 'data_table_model.dart';

class DataTableWidget extends StatefulWidget {
  final DataTableModel dataTableModel;
  final String hintTextSearch;

  const DataTableWidget({
    required this.dataTableModel,
    required this.hintTextSearch,
    super.key,
  });

  @override
  State<DataTableWidget> createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  late ScrollController _scrollController;
  late DataTableController _dataTableController;
  late int _sortColumnIndex;
  late bool _sortAscending;
  late List<List<DataTableRowModel>> _listData;
  static const _maxRowsPerPage = 12;
  late int _rowsPerPage;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _dataTableController = DataTableController();
    _sortColumnIndex = 0;
    _sortAscending = true;
    _listData = widget.dataTableModel.data;
    _rowsPerPage = _dataTableController.setRowsPerPage(
      listData: _listData,
      maxRowsPerPage: _maxRowsPerPage,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16),
        child: Material(
          color: Colors.transparent,
          child: PaginatedDataTable2(
            wrapInCard: false,
            scrollController: _scrollController,
            header: DataTableHeaderWidget(
              onChanged: _changeTextSearch,
              onClear: () => {},
              hintTextSearch: widget.hintTextSearch,
            ),
            columnSpacing: 12,
            horizontalMargin: 12,
            headingRowColor: MaterialStateProperty.all(Colors.transparent),
            sortArrowIcon: getPlatformIcon(IconType.arrow),
            sortColumnIndex: _sortColumnIndex,
            sortAscending: _sortAscending,
            rowsPerPage: _rowsPerPage,
            renderEmptyRowsInTheEnd: false,
            empty: const Text('Lista Vazia'),
            columns: _buildColumns(),
            source: CustomDataTableSource(listData: _listData),
          ),
        ),
      );

  void _changeTextSearch(String textSearch) {
    _listData = _dataTableController.changeTextSearch(
      dataTableModel: widget.dataTableModel,
      textSearch: textSearch,
      updateState: () => setState(
        () => _rowsPerPage = _dataTableController.setRowsPerPage(
          listData: _listData,
          maxRowsPerPage: _maxRowsPerPage,
        ),
      ),
    );
  }

  List<DataColumn> _buildColumns() => widget.dataTableModel.columns
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
                }
              : null,
        ),
      )
      .toList();
}
