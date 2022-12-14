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
  final Color? actionButtonIconColor;
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
    this.actionButtonIconColor,
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
                height: constraints.maxHeight / 3,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth / 45),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      PlatformToolIconWidget(
                        image: image,
                        width: constraints.maxWidth,
                      ),
                      Expanded(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: '$secondaryTitle \n',
                            style: secondaryTitleStyle.copyWith(
                              fontSize: constraints.maxWidth / 17,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: mainTitle,
                                style: mainTitleStyle.copyWith(
                                  color: mainTitleColor,
                                  fontSize: constraints.maxWidth / 9.5,
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
                    padding: EdgeInsets.all(constraints.maxWidth / 30),
                    child: SizedBox(
                      height: constraints.maxHeight / 2.5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (description != null)
                            Text(
                              description!,
                              style: descriptionStyle!.copyWith(
                                fontSize: constraints.maxWidth / 25,
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
                                  fontSize: constraints.maxWidth / 25,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: mainDescriptionExtend,
                                    style: descriptionStyle!.copyWith(
                                      color: mainTitleColor,
                                      fontSize: constraints.maxWidth / 25,
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
                        height: constraints.maxHeight / 10,
                        width: constraints.maxWidth / 1.5,
                        child: PlatformIconButtonWidget(
                          icon: PlatformIconWidget(
                            iconType: toolActionButtonIconType!,
                            size: constraints.maxWidth / 20,
                            color: actionButtonIconColor,
                          ),
                          label: toolActionButtonDescription!,
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
        ),
      );
}
