import 'package:flutter/widgets.dart';

import '../platform/card/platform_card_widget.dart';
import '../platform/icon/icon_type_enum.dart';
import '../platform/icon/platform_icon_widget.dart';
import '../platform/icon_button/platform_icon_button_widget.dart';
import '../platform/tool_icon/platform_tool_icon_widget.dart';

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
  final String? mainDescriptionExtend;
  final IconType? toolActionButtonIconType;
  final String? secondaryDescriptionExtend;
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
    this.mainDescriptionExtend,
    this.secondaryDescriptionExtend,
    this.toolActionButtonIconType,
    this.toolActionButtonDescription,
    this.toolAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PlatformCardWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PlatformToolIconWidget(
                      image: image,
                      width: 240,
                    ),
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: '$secondaryTitle \n',
                          style: secondaryTitleStyle.copyWith(
                            fontSize: 14,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: mainTitle,
                              style: mainTitleStyle.copyWith(
                                color: mainTitleColor,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: SizedBox(
                    height: 95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (description != null)
                          Text(
                            description!,
                            style: descriptionStyle!.copyWith(
                              fontSize: 9.5,
                            ),
                            textAlign: TextAlign.justify,
                          )
                        else
                          const SizedBox.shrink(),
                        if (mainDescriptionExtend != null && secondaryDescriptionExtend != null)
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: '$secondaryDescriptionExtend',
                              style: descriptionStyle!.copyWith(
                                fontSize: 9.5,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: mainDescriptionExtend,
                                  style: descriptionStyle!.copyWith(
                                    color: mainTitleColor,
                                    fontSize: 9.5,
                                  ),
                                ),
                              ],
                            ),
                          )
                        else
                          const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
                if (toolActionButtonIconType != null &&
                    toolActionButtonDescription != null &&
                    toolAction != null)
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 25,
                      width: 160,
                      child: PlatformIconButtonWidget(
                        icon: PlatformIconWidget(
                          iconType: toolActionButtonIconType!,
                          size: 12,
                        ),
                        label: toolActionButtonDescription!,
                        fontSize: 9,
                        onPressed: toolAction!,
                      ),
                    ),
                  )
                else
                  const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      );
}
