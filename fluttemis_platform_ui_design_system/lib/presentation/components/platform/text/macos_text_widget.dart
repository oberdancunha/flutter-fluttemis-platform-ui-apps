import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_text_widget.dart';
import 'text_type_enum.dart';

class MacosTextWidget extends PlatformTextWidget {
  const MacosTextWidget(
    super.text, {
    required super.textType,
    required super.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: getTextStyle(context, textType),
      );

  @override
  TextStyle getTextStyle(BuildContext context, TextType textType) {
    switch (textType) {
      case TextType.title:
        return MacosTheme.of(context).typography.title1.copyWith(
              color: MacosTheme.of(context).primaryColor,
              fontSize: fontSize,
            );
      case TextType.subTitle:
        return MacosTheme.of(context).typography.title2.copyWith(
              fontSize: fontSize,
            );
    }
  }
}
