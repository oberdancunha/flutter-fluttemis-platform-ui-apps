import 'package:fluttemis_platform_ui_core/domain/core/failure.dart';
import 'package:fluttemis_platform_ui_core/domain/core/file_failures.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../platform/container/container_type.dart';
import '../platform/container/platform_container_widget.dart';
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

    return PlatformContainerWidget(
      height: 75,
      width: 420,
      containerType: ContainerType.error,
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: Center(
              child: Image.asset(
                'assets/images/file_error/${errorMessageModel.image}',
                width: 45,
              ),
            ),
          ),
          const PlatformContainerWidget(
            height: 68,
            width: 1,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: PlatformTextWidget(
              errorMessageModel.message,
              textType: TextType.error,
              fontSize: 14,
            ),
          ),
        ],
      ),
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
