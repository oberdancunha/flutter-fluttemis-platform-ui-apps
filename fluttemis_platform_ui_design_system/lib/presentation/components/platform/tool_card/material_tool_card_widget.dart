import 'package:flutter/material.dart';

import '../../tool_widgets/tool_card/tool_card_widget.dart';
import 'platform_tool_card_widget.dart';

class MaterialToolCardWidget extends PlatformToolCardWidget {
  const MaterialToolCardWidget({
    required super.mainTitle,
    required super.secondaryTitle,
    required super.image,
    super.description,
    super.mainHint,
    super.hintComplement,
    super.toolActionButtonIconType,
    super.toolActionButtonDescription,
    super.toolAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ToolCardWidget(
        image: image,
        secondaryTitle: secondaryTitle,
        mainTitle: mainTitle,
        secondaryTitleStyle: Theme.of(context).textTheme.titleSmall!,
        mainTitleStyle: Theme.of(context).textTheme.titleLarge!,
        mainTitleColor: Theme.of(context).primaryColor,
        actionButtonColor: Theme.of(context).primaryColor,
        actionButtonBorderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(15),
        ),
        toolActionButtonIconType: toolActionButtonIconType,
        description: description,
        descriptionStyle: Theme.of(context).textTheme.bodyText2,
        mainHint: mainHint,
        hintComplement: hintComplement,
        toolActionButtonDescription: toolActionButtonDescription,
        toolAction: toolAction,
      );
}
