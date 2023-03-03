import 'package:flutter/widgets.dart';

import 'platform_text_style.dart';
import 'text_type_enum.dart';

class PlatformTextWidget extends StatelessWidget {
  final String text;
  final TextType textType;
  final double fontSize;
  final TextAlign? textAlign;
  final Color? color;
  final String? fontFamily;

  const PlatformTextWidget(
    this.text, {
    required this.textType,
    required this.fontSize,
    this.textAlign,
    this.color,
    this.fontFamily,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: getPlatformTextStyle(context, textType).copyWith(
          fontSize: fontSize,
          color: color,
          fontFamily: fontFamily,
        ),
        textAlign: textAlign,
      );
}
