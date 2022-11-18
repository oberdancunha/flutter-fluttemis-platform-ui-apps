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
    super.key,
  });

  @override
  Widget build(BuildContext context) => ToolCardWidget(
        image: image,
        imageColor: MacosColors.white,
        secondaryTitle: secondaryTitle,
        mainTitle: mainTitle,
        cardDecoration: BoxDecoration(
          color: MacosTheme.of(context).canvasColor.withAlpha(255),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: MacosColors.systemGrayColor,
              blurRadius: 10,
            ),
          ],
        ),
        secondaryTitleStyle: MacosTheme.of(context).typography.title3,
        mainTitleStyle: MacosTheme.of(context).typography.title1,
        mainTitleColor: MacosTheme.of(context).primaryColor.withAlpha(255),
        actionButtonColor: MacosTheme.of(context).primaryColor,
        actionButtonBorderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(15),
        ),
        actionButtonIcon: CupertinoIcons.doc_text_fill,
        description: description,
        descriptionStyle: MacosTheme.of(context).typography.body,
        mainDescriptionExtend: mainDescriptionExtend,
        secondaryDescriptionExtend: secondaryDescriptionExtend,
      );
}
