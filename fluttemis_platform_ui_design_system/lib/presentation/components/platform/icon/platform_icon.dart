import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/platform.dart';
import 'icon_type_enum.dart';

IconData getPlatformIcon(IconType iconType) {
  final currentPlatform = getCurrentPlatform();
  switch (currentPlatform) {
    case CurrentPlatform.isMacOS:
      switch (iconType) {
        case IconType.openFile:
          return CupertinoIcons.doc_text_fill;
        case IconType.menu:
          return CupertinoIcons.rectangle_grid_2x2;
        case IconType.recovery:
          return CupertinoIcons.arrow_2_circlepath;
        case IconType.table:
          return CupertinoIcons.table;
        case IconType.change:
          return CupertinoIcons.arrow_2_circlepath;
        case IconType.arrow:
          return CupertinoIcons.up_arrow;
      }
    case CurrentPlatform.isWindows:
      switch (iconType) {
        case IconType.openFile:
          return FluentIcons.text_document;
        case IconType.menu:
          return FluentIcons.grid_view_medium;
        case IconType.recovery:
          return FluentIcons.sync;
        case IconType.table:
          return FluentIcons.table;
        case IconType.change:
          return FluentIcons.sync;
        case IconType.arrow:
          return FluentIcons.up;
      }
    case CurrentPlatform.isLinux:
      switch (iconType) {
        case IconType.openFile:
          return Icons.file_open;
        case IconType.menu:
          return Icons.grid_view;
        case IconType.recovery:
          return Icons.loop;
        case IconType.table:
          return Icons.table_chart;
        case IconType.change:
          return Icons.loop;
        case IconType.arrow:
          return Icons.arrow_upward;
      }
  }
}
