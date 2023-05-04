import 'package:flutter/widgets.dart';

class ToolCardMainTitleWidget extends StatelessWidget {
  final String mainTitle;
  final TextStyle mainTitleStyle;
  final Color mainTitleColor;
  final double mainTitleFontSize;
  final String secondaryTitle;
  final TextStyle secondaryTitleStyle;
  final double secondaryTitleFontSize;

  const ToolCardMainTitleWidget({
    required this.mainTitle,
    required this.mainTitleStyle,
    required this.mainTitleColor,
    required this.mainTitleFontSize,
    required this.secondaryTitle,
    required this.secondaryTitleStyle,
    required this.secondaryTitleFontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) => RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: '$secondaryTitle \n',
          style: secondaryTitleStyle.copyWith(
            fontSize: secondaryTitleFontSize,
          ),
          children: <TextSpan>[
            TextSpan(
              text: mainTitle,
              style: mainTitleStyle.copyWith(
                color: mainTitleColor,
                fontSize: mainTitleFontSize,
              ),
            ),
          ],
        ),
      );
}
