import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../icon/platform_icon_widget.dart';
import '../icon_button/platform_button_widget.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(constraints.maxWidth / 50),
                    child: SizedBox(
                      width: constraints.maxWidth / 4,
                      height: constraints.maxHeight / 3,
                      child: Image.asset(
                        image,
                      ),
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
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(constraints.maxWidth / 30),
                    child: SizedBox(
                      height: constraints.maxHeight / 2.5,
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
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: constraints.maxHeight / 10,
                      width: constraints.maxWidth / 1.5,
                      child: PlatformIconButtonWidget(
                        icon: PlatformIconWidget(
                          actionButtonIcon,
                          size: constraints.maxWidth / 20,
                          color: actionButtonIconColor,
                        ),
                        label: FluttemisAppLocalizations.of(context)!.openFile,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
