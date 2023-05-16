import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../menu_tools/tools/menu_tool_widget.dart';
import '../menu_tools/tools/recovery_tool_widget.dart';
import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_style/sub_title_text_style.dart';
import 'failure_message_text_widget.dart';
import 'failure_recovery_widget.dart';

class FailureMessageWidget extends StatelessWidget {
  final String message;
  final String image;
  final bool tryAgain;

  const FailureMessageWidget({
    required this.message,
    required this.image,
    required this.tryAgain,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final accessHistoryToolWidget = Modular.get<AccessHistoryStore>().value.accessHistoryTool;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Center(
            child: FailureMessageTextWidget(
              message: message,
              image: image,
            ),
          ),
        ),
        PlatformTextWidget(
          FluttemisAppLocalizations.of(context)!.nextOptionInError,
          textStyle: SubTitleTextStyle(),
          fontSize: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (accessHistoryToolWidget != null) ...[
              FailureRecoveryWidget(
                child: accessHistoryToolWidget,
              ),
              const SizedBox(width: 20),
            ],
            const FailureRecoveryWidget(child: MenuToolWidget()),
            if (tryAgain) ...[
              const SizedBox(width: 20),
              const FailureRecoveryWidget(child: RecoveryToolWidget()),
            ],
          ],
        ),
      ],
    );
  }
}
