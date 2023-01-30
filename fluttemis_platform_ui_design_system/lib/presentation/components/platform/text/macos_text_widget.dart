import 'package:flutter/cupertino.dart';

import 'platform_text_style.dart';
import 'platform_text_widget.dart';

class MacosTextWidget extends PlatformTextWidget {
  const MacosTextWidget(
    super.text, {
    required super.textType,
    required super.fontSize,
    super.textAlign,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: getPlatformTextStyle(context, textType).copyWith(
          fontSize: fontSize,
        ),
        textAlign: textAlign,
      );
}
