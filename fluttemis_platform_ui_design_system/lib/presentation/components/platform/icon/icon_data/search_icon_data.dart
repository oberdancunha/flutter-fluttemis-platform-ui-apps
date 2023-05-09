import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_icon_data.dart';

class SearchIconData extends PlatformIconData {
  @override
  IconData getMacosStyle() => CupertinoIcons.search;

  @override
  IconData getWindowsStyle() => FluentIcons.search;

  @override
  IconData getMaterialStyle() => Icons.search;
}
