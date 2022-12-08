import 'package:flutter/material.dart';

import '../../tool_card/tool_card_widget.dart';
import 'platform_tool_card_widget.dart';

class MaterialToolCardWidget extends PlatformToolCardWidget {
  const MaterialToolCardWidget({
    required super.mainTitle,
    required super.secondaryTitle,
    required super.image,
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
        backgroundColor: Theme.of(context).backgroundColor,
        borderColor: Theme.of(context).primaryColor,
        image: image,
        imageColor: Colors.white,
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
        mainDescriptionExtend: mainDescriptionExtend,
        secondaryDescriptionExtend: secondaryDescriptionExtend,
        actionButtonIconColor: Colors.white,
        toolActionButtonDescription: toolActionButtonDescription,
        toolAction: toolAction,
      );
}
