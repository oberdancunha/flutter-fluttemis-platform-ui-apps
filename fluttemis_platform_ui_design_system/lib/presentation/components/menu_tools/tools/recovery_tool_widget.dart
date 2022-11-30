import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../../platform/icon/icon_type_enum.dart';
import '../../platform/tool_card/platform_tool_card_widget.dart';

class RecoveryToolWidget extends StatelessWidget {
  const RecoveryToolWidget({super.key});

  @override
  Widget build(BuildContext context) => PlatformToolCardWidget(
        image: 'assets/images/recovery.png',
        mainTitle: FluttemisAppLocalizations.of(context)!.again,
        secondaryTitle: FluttemisAppLocalizations.of(context)!.tryMessage,
        toolActionButtonIconType: IconType.recovery,
        toolActionButtonDescription: FluttemisAppLocalizations.of(context)!.tryAgain,
        description: FluttemisAppLocalizations.of(context)!.tryAgainDescription,
        toolAction: () {
          if (Modular.args.data != null) {
            Modular.to.pushNamed(Modular.to.path, arguments: Modular.args.data);
          } else {
            Modular.to.pushNamed(Modular.to.path);
          }
        },
      );
}
