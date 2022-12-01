import 'package:fluttemis_platform_ui_core/domain/core/failure.dart';
import 'package:fluttemis_platform_ui_core/domain/core/file_failures.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../platform/circular_image/platform_circular_image_widget.dart';
import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';
import 'error_message_model.dart';

class ErrorMessageTextWidget extends StatelessWidget {
  final Failure failure;

  const ErrorMessageTextWidget({
    required this.failure,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final errorMessageModel = _getErrorWidgetByType(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PlatformCircularImageWidget(
          imageWidget: Image.asset(
            'assets/images/file_error/${errorMessageModel.image}',
            width: MediaQuery.of(context).size.width / 30,
          ),
          width: MediaQuery.of(context).size.width / 20,
        ),
        SizedBox(width: MediaQuery.of(context).size.width / 80),
        PlatformTextWidget(
          errorMessageModel.message,
          textType: TextType.error,
          fontSize: MediaQuery.of(context).size.width / 80,
        ),
      ],
    );
  }

  ErrorMessageModel _getErrorWidgetByType(BuildContext context) {
    switch (failure.runtimeType) {
      case FileFailureEmpty:
        return ErrorMessageModel(
          image: 'file_empty.png',
          message: FluttemisAppLocalizations.of(context)!.fileEmpty,
        );
      case FileFailureFormatIncorrect:
        return ErrorMessageModel(
          image: 'file_format_error.png',
          message: FluttemisAppLocalizations.of(context)!.fileFormatError,
        );
      case FileFailureNotFound:
        return ErrorMessageModel(
          image: 'file_not_found.png',
          message: FluttemisAppLocalizations.of(context)!.fileNotFound,
        );
      default:
        return ErrorMessageModel(
          image: 'file_unexpected_error.png',
          message: FluttemisAppLocalizations.of(context)!.fileUnexpectedError,
        );
    }
  }
}
