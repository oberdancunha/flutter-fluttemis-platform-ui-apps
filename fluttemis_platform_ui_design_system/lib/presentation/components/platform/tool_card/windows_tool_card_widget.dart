import 'package:fluent_ui/fluent_ui.dart';

import '../../tool_card/tool_card_widget.dart';
import 'platform_tool_card_widget.dart';

class WindowsToolCardWidget extends PlatformToolCardWidget {
  const WindowsToolCardWidget({
    required super.image,
    required super.mainTitle,
    required super.secondaryTitle,
    super.description,
    super.mainDescriptionExtend,
    super.secondaryDescriptionExtend,
    super.toolActionButtonIconType,
    super.toolActionButtonDescription,
    super.toolAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ToolCardWidget(
        backgroundColor: FluentTheme.of(context).cardColor,
        shadowColor: FluentTheme.of(context).shadowColor,
        image: image,
        imageColor: Colors.white,
        secondaryTitle: secondaryTitle,
        mainTitle: mainTitle,
        secondaryTitleStyle: FluentTheme.of(context).typography.subtitle!,
        mainTitleStyle: FluentTheme.of(context).typography.title!,
        mainTitleColor: FluentTheme.of(context).accentColor,
        actionButtonColor: FluentTheme.of(context).accentColor,
        actionButtonBorderRadius: BorderRadius.zero,
        toolActionButtonIconType: toolActionButtonIconType,
        description: description,
        descriptionStyle: FluentTheme.of(context).typography.caption,
        mainDescriptionExtend: mainDescriptionExtend,
        secondaryDescriptionExtend: secondaryDescriptionExtend,
        toolActionButtonDescription: toolActionButtonDescription,
        toolAction: toolAction,
      );
}
