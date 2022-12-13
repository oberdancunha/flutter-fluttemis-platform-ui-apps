import 'package:flutter/widgets.dart';

import '../../platform/icon/icon_type_enum.dart';
import '../../platform/tool_card/platform_tool_card_widget.dart';
import '../../tool_widgets/tool_icon_action_widget.dart';

abstract class ITemplateTool extends StatefulWidget {
  const ITemplateTool({
    super.key,
  });
}

abstract class ITemplateToolState<TemplateTool extends ITemplateTool> extends State<TemplateTool> {
  String get image;
  String get mainTitle;
  String get secondaryTitle;
  String? get description => null;
  String? get mainDescriptionExtend => null;
  String? get secondaryDescriptionExtend => null;
  IconType? get toolActionButtonIconType => null;
  String? get toolActionButtonDescription => null;
  VoidCallback? get toolAction => null;

  PlatformToolCardWidget get platformToolCardWidget => PlatformToolCardWidget(
        image: image,
        mainTitle: mainTitle,
        secondaryTitle: secondaryTitle,
        description: description,
        mainDescriptionExtend: mainDescriptionExtend,
        secondaryDescriptionExtend: secondaryDescriptionExtend,
        toolActionButtonIconType: toolActionButtonIconType,
        toolActionButtonDescription: toolActionButtonDescription,
        toolAction: toolAction,
      );

  Widget get platformToolIconWidget => LayoutBuilder(
        builder: (_, constraints) => ToolIconActionWidget(
          image: image,
          message: '$secondaryTitle $mainTitle',
          width: constraints.maxWidth,
          toolAction: toolAction!,
        ),
      );

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) {
          final aspectRatioElementToEntireScreen =
              constraints.maxWidth / MediaQuery.of(context).size.width;

          return aspectRatioElementToEntireScreen > 0.1
              ? platformToolCardWidget
              : platformToolIconWidget;
        },
      );
}
