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
        style: getTextStyle(context, textType).copyWith(
          fontSize: fontSize,
        ),
      );

  @override
  TextStyle getTextStyle(BuildContext context, TextType textType) {
    switch (textType) {
      case TextType.mainTitle:
        return Theme.of(context).textTheme.titleLarge!.copyWith();
      case TextType.title:
        return Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).primaryColor,
            );
      case TextType.subTitle:
        return Theme.of(context).textTheme.subtitle1!.copyWith();
      case TextType.error:
        return Theme.of(context).textTheme.displaySmall!.copyWith(
              color: Theme.of(context).errorColor,
            );
      case TextType.caption:
        return Theme.of(context).textTheme.caption!.copyWith(
              color: Colors.grey.shade500,
            );
      case TextType.label:
        return Theme.of(context).textTheme.caption!.copyWith(
              color: Colors.grey.shade800,
            );
    }
  }
}
