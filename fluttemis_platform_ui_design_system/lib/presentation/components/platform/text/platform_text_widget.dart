import 'package:flutter/widgets.dart';

import 'text_style/platform_text_style.dart';

class PlatformTextWidget extends StatelessWidget {
  final String text;
  final PlatformTextStyle textStyle;
  final double fontSize;
  final TextAlign? textAlign;
  final Color? color;
  final String? fontFamily;

  const PlatformTextWidget(
    this.text, {
    required this.textStyle,
    required this.fontSize,
    this.textAlign,
    this.color,
    this.fontFamily,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: textStyle().copyWith(
          fontSize: fontSize,
          color: color,
          fontFamily: fontFamily,
        ),
        textAlign: textAlign,
      );
}
