import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

import '../color/platform_color.dart';
import 'platform_scaffold_widget.dart';

class MacosScaffoldWidget extends PlatformScaffoldWidget {
  const MacosScaffoldWidget({
    required super.title,
    required super.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MacosWindow(
        titleBar: TitleBar(
          height: 30,
          dividerColor: getPlatformColor(0x00000000),
          title: title,
        ),
        child: body,
      );
}
