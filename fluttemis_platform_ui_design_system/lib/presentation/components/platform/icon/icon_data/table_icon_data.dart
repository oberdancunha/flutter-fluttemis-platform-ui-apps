import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_icon_data.dart';

class TableIconData extends PlatformIconData {
  @override
  IconData getMacosStyle() => CupertinoIcons.table;

  @override
  IconData getWindowsStyle() => FluentIcons.table;

  @override
  IconData getMaterialStyle() => Icons.table_chart;
}
