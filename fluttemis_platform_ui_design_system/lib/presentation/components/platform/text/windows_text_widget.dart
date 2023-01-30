import 'package:fluent_ui/fluent_ui.dart';

import 'platform_text_style.dart';
import 'platform_text_widget.dart';

class WindowsTextWidget extends PlatformTextWidget {
  const WindowsTextWidget(
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
