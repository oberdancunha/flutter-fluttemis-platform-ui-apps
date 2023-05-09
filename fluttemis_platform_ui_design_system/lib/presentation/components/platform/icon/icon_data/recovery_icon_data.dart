import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_icon_data.dart';

class RecoveryIconData extends PlatformIconData {
  @override
  IconData getMacosStyle() => CupertinoIcons.arrow_2_circlepath;

  @override
  IconData getWindowsStyle() => FluentIcons.sync;

  @override
  IconData getMaterialStyle() => Icons.loop;
}
