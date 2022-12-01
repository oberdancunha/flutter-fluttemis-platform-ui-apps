import 'package:flutter/material.dart';

import 'platform_text_widget.dart';
import 'text_type_enum.dart';

class MaterialTextWidget extends PlatformTextWidget {
  const MaterialTextWidget(
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
        return Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).primaryColor,
              fontSize: fontSize,
            );
      case TextType.subTitle:
        return Theme.of(context).textTheme.subtitle1!.copyWith(
              fontSize: fontSize,
            );
      case TextType.error:
        return Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Theme.of(context).errorColor,
              fontSize: fontSize,
            );
    }
  }
}
