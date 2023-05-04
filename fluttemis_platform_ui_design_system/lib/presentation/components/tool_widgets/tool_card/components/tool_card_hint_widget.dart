import 'package:flutter/widgets.dart';

class ToolCardHintWidget extends StatelessWidget {
  final String? mainHint;
  final TextStyle? mainHintStyle;
  final Color mainHintColor;
  final double mainHintFontSize;
  final String? hintComplement;
  final TextStyle? hintComplementStyle;
  final double hintComplementFontSize;

  const ToolCardHintWidget({
    required this.mainHintColor,
    required this.mainHintFontSize,
    required this.hintComplementFontSize,
    this.mainHint,
    this.mainHintStyle,
    this.hintComplement,
    this.hintComplementStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Visibility(
        visible: mainHint != null && hintComplement != null,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: hintComplement,
            style: hintComplementStyle!.copyWith(
              fontSize: hintComplementFontSize,
            ),
            children: <TextSpan>[
              TextSpan(
                text: mainHint,
                style: mainHintStyle!.copyWith(
                  color: mainHintColor,
                  fontSize: mainHintFontSize,
                ),
              ),
            ],
          ),
        ),
      );
}
