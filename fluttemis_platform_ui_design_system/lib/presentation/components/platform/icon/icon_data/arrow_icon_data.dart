import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_icon_data.dart';

class ArrowIconData extends PlatformIconData {
  @override
  IconData getMacosStyle() => CupertinoIcons.up_arrow;

  @override
  IconData getWindowsStyle() => FluentIcons.up;

  @override
  IconData getMaterialStyle() => Icons.arrow_upward;
}
