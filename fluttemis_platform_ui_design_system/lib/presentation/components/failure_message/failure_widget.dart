import 'package:fluttemis_platform_ui_core/domain/failure.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import 'failure_message_widget.dart';

class FailureWidget extends StatelessWidget {
  final Failure failure;

  const FailureWidget({
    required this.failure,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fluttemisAppLocalizations = FluttemisAppLocalizations.of(context)!;

    return failure.join(
      (file) => file.failure.join(
        (notFound) => FailureMessageWidget(
          image: 'file_not_found.png',
          message: fluttemisAppLocalizations.fileNotFound,
          tryAgain: false,
        ),
        (parseError) => FailureMessageWidget(
          image: 'file_unexpected_error.png',
          message: fluttemisAppLocalizations.fileUnexpectedError,
          tryAgain: true,
        ),
        (empty) => FailureMessageWidget(
          image: 'file_empty.png',
          message: fluttemisAppLocalizations.fileEmpty,
          tryAgain: false,
        ),
        (formatIncorrect) => FailureMessageWidget(
          image: 'file_format_error.png',
          message: fluttemisAppLocalizations.fileFormatError,
          tryAgain: false,
        ),
      ),
      SizedBox.shrink,
    );
  }
}
