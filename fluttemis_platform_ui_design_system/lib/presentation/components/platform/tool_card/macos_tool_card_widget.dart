import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../tool_card/tool_card_widget.dart';
import 'platform_tool_card_widget.dart';

class MacosToolCardWidget extends PlatformToolCardWidget {
  const MacosToolCardWidget({
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
        backgroundColor: MacosTheme.of(context).canvasColor,
        shadowColor: const MacosColor(0xFF8E8E93),
        image: image,
        imageColor: MacosColors.white,
        secondaryTitle: secondaryTitle,
        mainTitle: mainTitle,
        secondaryTitleStyle: MacosTheme.of(context).typography.title3,
        mainTitleStyle: MacosTheme.of(context).typography.title1,
        mainTitleColor: MacosTheme.of(context).primaryColor.withAlpha(255),
        actionButtonColor: MacosTheme.of(context).primaryColor,
        actionButtonBorderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(15),
        ),
        toolActionButtonIconType: toolActionButtonIconType,
        description: description,
        descriptionStyle: MacosTheme.of(context).typography.body,
        mainDescriptionExtend: mainDescriptionExtend,
        secondaryDescriptionExtend: secondaryDescriptionExtend,
        toolActionButtonDescription: toolActionButtonDescription,
        toolAction: toolAction,
      );
}
