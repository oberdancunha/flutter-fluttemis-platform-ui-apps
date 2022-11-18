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
    super.key,
  });

  @override
  Widget build(BuildContext context) => ToolCardWidget(
        image: image,
        imageColor: Colors.white,
        secondaryTitle: secondaryTitle,
        mainTitle: mainTitle,
        cardDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Theme.of(context).primaryColor,
          ),
        ),
        secondaryTitleStyle: Theme.of(context).textTheme.titleSmall!,
        mainTitleStyle: Theme.of(context).textTheme.titleLarge!,
        mainTitleColor: Theme.of(context).primaryColor,
        actionButtonColor: Theme.of(context).primaryColor,
        actionButtonBorderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(15),
        ),
        actionButtonIcon: Icons.file_open,
        description: description,
        descriptionStyle: Theme.of(context).textTheme.bodyText2,
        mainDescriptionExtend: mainDescriptionExtend,
        secondaryDescriptionExtend: secondaryDescriptionExtend,
      );
}
