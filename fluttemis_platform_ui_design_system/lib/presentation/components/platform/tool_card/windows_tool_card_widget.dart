import 'package:fluent_ui/fluent_ui.dart';

import 'build_tool_card.dart';
import 'platform_tool_card_widget.dart';

class WindowsToolCardWidget extends PlatformToolCardWidget {
  const WindowsToolCardWidget({
    required super.mainTitle,
    required super.secondaryTitle,
    required super.description,
    required super.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) => BuildToolCard(
        image: image,
        secondaryTitle: secondaryTitle,
        mainTitle: mainTitle,
        cardDecoration: BoxDecoration(
          color: FluentTheme.of(context).cardColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: FluentTheme.of(context).shadowColor,
              blurRadius: 4,
            ),
          ],
        ),
        secondaryTitleStyle: FluentTheme.of(context).typography.subtitle!,
        mainTitleStyle: FluentTheme.of(context).typography.title!,
        mainTitleColor: FluentTheme.of(context).accentColor,
        description: description,
        descriptionStyle: FluentTheme.of(context).typography.caption!,
        actionButtonColor: FluentTheme.of(context).accentColor,
        actionButtonBorderRadius: BorderRadius.zero,
        actionButtonIcon: FluentIcons.text_document,
        actionButtonIconColor: Colors.white,
      );
}
