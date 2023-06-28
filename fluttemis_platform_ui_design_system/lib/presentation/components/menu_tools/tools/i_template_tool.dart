import 'dart:async';

import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../../platform/icon/icon_data/platform_icon_data.dart';
import '../../platform/icon_button/button_status/button_status_store.dart';
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
  String? get description;
  String? get mainHint => null;
  String? get hintComplement => null;
  PlatformIconData? get toolActionButtonIconData;
  String? get toolActionButtonDescription;
  String get route;
  FutureOr<bool> coreToolAction();
  VoidCallback get callRoute => () => Modular.to.navigate(route);
  VoidCallback? get toolAction => () async {
        final buttonStatusStore = Modular.get<ButtonStatusStore>();
        final isButtonDisabled = buttonStatusStore.buttonsDisabled[ButtonTypeStatus.menuToolButton];
        if (isButtonDisabled == null || !isButtonDisabled) {
          final goToTheNext = await coreToolAction.call();
          if (goToTheNext) {
            callRoute();
          }
        }
      };

  PlatformToolCardWidget get platformToolCardWidget => PlatformToolCardWidget(
        image: image,
        mainTitle: mainTitle,
        secondaryTitle: secondaryTitle,
        description: description,
        mainHint: mainHint,
        hintComplement: hintComplement,
        toolActionButtonIconData: toolActionButtonIconData,
        toolActionButtonDescription: toolActionButtonDescription,
        toolAction: toolAction,
      );

  Widget get platformToolIconWidget => LayoutBuilder(
        builder: (_, constraints) => ToolIconActionWidget(
          image: image,
          message: '$secondaryTitle $mainTitle',
          width: 105,
          toolAction: toolAction!,
        ),
      );

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) {
          final aspectRatioElementToEntireScreen =
              constraints.maxHeight / MediaQuery.of(context).size.height;

          return aspectRatioElementToEntireScreen > 0.07
              ? platformToolCardWidget
              : platformToolIconWidget;
        },
      );
}
