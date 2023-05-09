import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_icon_data.dart';

class OpenFileIconData extends PlatformIconData {
  @override
  IconData getMacosStyle() => CupertinoIcons.doc_text_fill;

  @override
  IconData getWindowsStyle() => FluentIcons.text_document;

  @override
  IconData getMaterialStyle() => Icons.file_open;
}
