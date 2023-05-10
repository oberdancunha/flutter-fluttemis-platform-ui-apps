import 'package:flutter/widgets.dart';

import '../../platform/card/platform_card_widget.dart';
import '../../platform/icon/icon_data/platform_icon_data.dart';
import 'components/tool_card_action_button_widget.dart';
import 'components/tool_card_description_widget.dart';
import 'components/tool_card_hint_widget.dart';
import 'components/tool_card_main_icon_widget.dart';
import 'components/tool_card_main_title_widget.dart';

class ToolCardWidget extends StatelessWidget {
  final String image;
  final String secondaryTitle;
  final String mainTitle;
  final TextStyle secondaryTitleStyle;
  final TextStyle mainTitleStyle;
  final Color mainTitleColor;
  final Color actionButtonColor;
  final BorderRadiusGeometry actionButtonBorderRadius;
  final String? description;
  final TextStyle? descriptionStyle;
  final String? mainHint;
  final String? hintComplement;
  final PlatformIconData? toolActionButtonIconData;
  final String? toolActionButtonDescription;
  final VoidCallback? toolAction;

  const ToolCardWidget({
    required this.image,
    required this.secondaryTitle,
    required this.mainTitle,
    required this.secondaryTitleStyle,
    required this.mainTitleStyle,
    required this.mainTitleColor,
    required this.actionButtonColor,
    required this.actionButtonBorderRadius,
    this.description,
    this.descriptionStyle,
    this.mainHint,
    this.hintComplement,
    this.toolActionButtonIconData,
    this.toolActionButtonDescription,
    this.toolAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) => PlatformCardWidget(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ToolCardMainIconWidget(
                        image: image,
                        width: constraints.maxWidth,
                      ),
                      Expanded(
                        child: ToolCardMainTitleWidget(
                          mainTitle: mainTitle,
                          mainTitleStyle: mainTitleStyle,
                          mainTitleColor: mainTitleColor,
                          mainTitleFontSize: constraints.maxWidth * 0.11,
                          secondaryTitle: secondaryTitle,
                          secondaryTitleStyle: secondaryTitleStyle,
                          secondaryTitleFontSize: constraints.maxWidth * 0.065,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      bottom: 5,
                    ),
                    child: SizedBox(
                      height: constraints.maxHeight * 0.35,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ToolCardDescriptionWidget(
                            width: constraints.maxWidth * 0.045,
                            description: description,
                          ),
                          SizedBox(height: constraints.maxHeight * 0.03),
                          ToolCardHintWidget(
                            mainHint: mainHint,
                            mainHintStyle: descriptionStyle,
                            mainHintColor: mainTitleColor,
                            mainHintFontSize: constraints.maxWidth * 0.05,
                            hintComplement: hintComplement,
                            hintComplementStyle: descriptionStyle,
                            hintComplementFontSize: constraints.maxWidth * 0.04,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ToolCardActionButtonWidget(
                    toolActionButtonIconData: toolActionButtonIconData,
                    toolActionButtonDescription: toolActionButtonDescription,
                    toolAction: toolAction,
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    topSpacingHeight: constraints.maxHeight * 0.035,
                    iconSize: constraints.maxWidth * 0.05,
                    labelFontSize: constraints.maxWidth * 0.04,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
