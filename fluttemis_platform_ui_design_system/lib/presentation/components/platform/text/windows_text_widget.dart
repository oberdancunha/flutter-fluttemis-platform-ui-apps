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
        style: getTextStyle(context, textType),
      );

  @override
  TextStyle getTextStyle(BuildContext context, TextType textType) {
    switch (textType) {
      case TextType.title:
        return FluentTheme.of(context).typography.title!.copyWith(
              color: FluentTheme.of(context).accentColor,
              fontSize: fontSize,
            );
      case TextType.subTitle:
        return FluentTheme.of(context).typography.subtitle!.copyWith(
              fontSize: fontSize,
            );
      case TextType.error:
        return FluentTheme.of(context).typography.display!.copyWith(
              color: Colors.red,
              fontSize: fontSize,
            );
    }
  }
}
