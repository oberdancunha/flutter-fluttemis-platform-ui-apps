import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_icon_data.dart';

class MenuIconData extends PlatformIconData {
  @override
  IconData getMacosStyle() => CupertinoIcons.rectangle_grid_2x2;

  @override
  IconData getWindowsStyle() => FluentIcons.grid_view_medium;

  @override
  IconData getMaterialStyle() => Icons.grid_view;
}
