import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_icon_data.dart';

class ClearIconData extends PlatformIconData {
  @override
  IconData getMacosStyle() => CupertinoIcons.clear;

  @override
  IconData getWindowsStyle() => FluentIcons.clear;

  @override
  IconData getMaterialStyle() => Icons.clear;
}
