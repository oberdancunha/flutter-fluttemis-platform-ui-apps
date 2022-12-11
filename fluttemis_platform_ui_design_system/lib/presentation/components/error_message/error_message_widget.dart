import 'package:fluttemis_platform_ui_core/domain/core/failure.dart';
import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../menu_tools/tools/menu_tool_widget.dart';
import '../menu_tools/tools/recovery_tool_widget.dart';
import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';
import 'error_message_text_widget.dart';
import 'error_recovery_option_widget.dart';

class ErrorMessageWidget extends StatefulWidget {
  final Failure failure;

  const ErrorMessageWidget({
    required this.failure,
    super.key,
  });

  @override
  State<ErrorMessageWidget> createState() => _ErrorMessageWidgetState();
}

class _ErrorMessageWidgetState extends State<ErrorMessageWidget> {
  @override
  void dispose() {
    Modular.dispose<AccessHistoryStore>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accessHistoryToolWidget = Modular.get<AccessHistoryStore>().value.accessHistoryTool;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: ErrorMessageTextWidget(
              failure: widget.failure,
            ),
          ),
        ),
        PlatformTextWidget(
          FluttemisAppLocalizations.of(context)!.nextOptionInError,
          textType: TextType.subTitle,
          fontSize: MediaQuery.of(context).size.width / 60,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (accessHistoryToolWidget != null) ...[
              ErrorRecoveryOptionWidget(
                child: accessHistoryToolWidget,
              ),
              SizedBox(width: MediaQuery.of(context).size.width / 40),
            ],
            const ErrorRecoveryOptionWidget(child: MenuToolWidget()),
            if (widget.failure.tryAgain) ...[
              SizedBox(width: MediaQuery.of(context).size.width / 40),
              const ErrorRecoveryOptionWidget(child: RecoveryToolWidget()),
            ],
          ],
        ),
      ],
    );
  }
}
