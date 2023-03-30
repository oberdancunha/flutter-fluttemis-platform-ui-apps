import 'package:fluttemis_platform_ui_core/domain/failure.dart';
import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../menu_tools/tools/menu_tool_widget.dart';
import '../menu_tools/tools/recovery_tool_widget.dart';
import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';
import 'error_message_text_widget.dart';
import 'error_recovery_option_widget.dart';

class ErrorMessageWidget extends StatelessWidget {
  final Failure failure;

  const ErrorMessageWidget({
    required this.failure,
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
            child: ErrorMessageTextWidget(
              failure: failure,
            ),
          ),
        ),
        PlatformTextWidget(
          FluttemisAppLocalizations.of(context)!.nextOptionInError,
          textType: TextType.subTitle,
          fontSize: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (accessHistoryToolWidget != null) ...[
              ErrorRecoveryOptionWidget(
                child: accessHistoryToolWidget,
              ),
              const SizedBox(width: 20),
            ],
            const ErrorRecoveryOptionWidget(child: MenuToolWidget()),
            if (failure.tryAgain) ...[
              const SizedBox(width: 20),
              const ErrorRecoveryOptionWidget(child: RecoveryToolWidget()),
            ],
          ],
        ),
      ],
    );
  }
}
