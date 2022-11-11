import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_text_widget.dart';

class MacosTextWidget extends PlatformTextWidget {
  const MacosTextWidget(
    super.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: MacosTheme.of(context).typography.title2,
      );
}
