import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../icon/platform_icon_widget.dart';
import '../tooltip/platform_tooltip_widget.dart';

class BuildToolCard extends StatelessWidget {
  final String image;
  final String secondaryTitle;
  final String mainTitle;
  final BoxDecoration cardDecoration;
  final TextStyle secondaryTitleStyle;
  final TextStyle mainTitleStyle;
  final Color mainTitleColor;
  final String description;
  final TextStyle descriptionStyle;
  final Color actionButtonColor;
  final BorderRadiusGeometry actionButtonBorderRadius;
  final IconData actionButtonIcon;
  final Color actionButtonIconColor;

  const BuildToolCard({
    required this.image,
    required this.secondaryTitle,
    required this.mainTitle,
    required this.cardDecoration,
    required this.secondaryTitleStyle,
    required this.mainTitleStyle,
    required this.mainTitleColor,
    required this.description,
    required this.descriptionStyle,
    required this.actionButtonColor,
    required this.actionButtonBorderRadius,
    required this.actionButtonIcon,
    required this.actionButtonIconColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) => DecoratedBox(
          decoration: cardDecoration,
          child: Column(
            children: [
              SizedBox(
                height: constraints.maxHeight / 2,
                child: Image.asset(
                  image,
                  width: constraints.maxWidth / 2,
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: '$secondaryTitle \n',
                  style: secondaryTitleStyle.copyWith(
                    fontSize: constraints.maxWidth / 15,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: mainTitle,
                      style: mainTitleStyle.copyWith(
                        color: mainTitleColor,
                        fontSize: constraints.maxWidth / 10,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: constraints.maxWidth / 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    description,
                    style: descriptionStyle.copyWith(
                      fontSize: constraints.maxWidth / 25,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: constraints.maxHeight / 15,
                  width: constraints.maxWidth / 7.5,
                  decoration: BoxDecoration(
                    color: actionButtonColor,
                    borderRadius: actionButtonBorderRadius,
                  ),
                  child: PlatformTooltipWidget(
                    message: FluttemisAppLocalizations.of(context)!.openFile,
                    child: PlatformIconWidget(
                      actionButtonIcon,
                      size: constraints.maxWidth / 15,
                      color: actionButtonIconColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
