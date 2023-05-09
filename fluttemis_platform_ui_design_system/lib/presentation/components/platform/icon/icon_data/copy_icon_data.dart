import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_icon_data.dart';

class CopyIconData extends PlatformIconData {
  @override
  IconData getMacosStyle() => CupertinoIcons.square_on_square;

  @override
  IconData getWindowsStyle() => FluentIcons.copy;

  @override
  IconData getMaterialStyle() => Icons.copy;
}
