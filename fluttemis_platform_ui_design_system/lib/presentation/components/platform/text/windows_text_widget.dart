import 'package:fluent_ui/fluent_ui.dart';

import 'platform_text_widget.dart';
import 'text_type_enum.dart';

class WindowsTextWidget extends PlatformTextWidget {
  const WindowsTextWidget(
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
        return FluentTheme.of(context).typography.title!;
      case TextType.title:
        return FluentTheme.of(context).typography.title!.copyWith(
              color: FluentTheme.of(context).accentColor,
            );
      case TextType.subTitle:
        return FluentTheme.of(context).typography.subtitle!.copyWith();
      case TextType.error:
        return FluentTheme.of(context).typography.body!.copyWith(
              color: Colors.red,
            );
      case TextType.caption:
        return FluentTheme.of(context).typography.caption!.copyWith(
              color: Colors.grey[90],
            );
      case TextType.label:
        return FluentTheme.of(context).typography.caption!.copyWith(
              color: Colors.grey[160],
            );
      case TextType.genomeName:
        return FluentTheme.of(context).typography.subtitle!.copyWith(
              fontStyle: FontStyle.italic,
            );
    }
  }
}
