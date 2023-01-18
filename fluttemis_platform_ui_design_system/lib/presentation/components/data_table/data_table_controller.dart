import 'package:fluttemis_platform_ui_core/domain/core/value_transformer.dart';
import 'package:flutter/material.dart';

import 'data_table_model.dart';

class DataTableController {
  List<List<DataTableRowModel<dynamic>>> sort<T>({
    required List<List<DataTableRowModel<dynamic>>> listData,
    required int columnIndex,
    required bool ascending,
    required VoidCallback updateState,
  }) {
    listData.sort(
      (listDataA, listDataB) {
        var dataA = listDataA.elementAt(columnIndex);
        var dataB = listDataB.elementAt(columnIndex);
        if (!ascending) {
          final auxDataA = dataA;
          dataA = dataB;
          dataB = auxDataA;
        }

        final Comparable<T> comparableDataA =
            (dataA.rawDataToSort ?? dataA.rawData) as Comparable<T>;
        final Comparable<T> comparableDataB =
            (dataB.rawDataToSort ?? dataB.rawData) as Comparable<T>;

        return Comparable.compare(comparableDataA, comparableDataB);
      },
    );
    updateState();

    return listData;
  }

  List<List<DataTableRowModel<dynamic>>> changeTextSearch({
    required List<List<DataTableRowModel<dynamic>>> originalListData,
    required String textSearch,
  }) {
    final textSearchTrimmed = removeExcessiveWhiteSpaces(textSearch);
    final listData = originalListData.where(
      (dataRow) {
        var found = false;
        for (final data in dataRow) {
          found = data.rawData.toString().toLowerCase().contains(
                textSearchTrimmed.toLowerCase(),
              );
          if (found) {
            break;
          }
        }

        return found;
      },
    ).toList();

    return listData;
  }

  int setRowsPerPage({
    required List<List<DataTableRowModel<dynamic>>> listData,
    required int maxRowsPerPage,
  }) {
    final rowsPerPage = listData.isNotEmpty
        ? listData.length < maxRowsPerPage
            ? listData.length
            : maxRowsPerPage
        : 1;

    return rowsPerPage;
  }
}
