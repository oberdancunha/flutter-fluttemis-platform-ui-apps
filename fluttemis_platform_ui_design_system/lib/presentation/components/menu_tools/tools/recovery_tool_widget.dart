import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../../platform/icon/icon_data/recovery_icon_data.dart';
import '../../platform/tool_card/platform_tool_card_widget.dart';

class RecoveryToolWidget extends StatelessWidget {
  const RecoveryToolWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final fluttemisAppLocalizations = FluttemisAppLocalizations.of(context)!;

    return PlatformToolCardWidget(
      image: 'assets/images/recovery.png',
      mainTitle: fluttemisAppLocalizations.again,
      secondaryTitle: fluttemisAppLocalizations.tryMessage,
      toolActionButtonIconData: RecoveryIconData(),
      toolActionButtonDescription: fluttemisAppLocalizations.tryAgain,
      description: fluttemisAppLocalizations.tryAgainDescription,
      toolAction: () {
        if (Modular.args.data != null) {
          Modular.to.pushNamed(Modular.to.path, arguments: Modular.args.data);
        } else {
          Modular.to.pushNamed(Modular.to.path);
        }
      },
    );
  }
}
