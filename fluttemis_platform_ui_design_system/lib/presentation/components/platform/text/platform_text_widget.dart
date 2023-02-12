import 'package:flutter/widgets.dart';

import 'platform_text_style.dart';
import 'text_type_enum.dart';

class PlatformTextWidget extends StatelessWidget {
  final String text;
  final TextType textType;
  final double fontSize;
  final TextAlign? textAlign;

  const PlatformTextWidget(
    this.text, {
    required this.textType,
    required this.fontSize,
    this.textAlign,
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
