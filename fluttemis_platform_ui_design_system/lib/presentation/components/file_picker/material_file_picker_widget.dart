import 'package:flutter/material.dart';

import 'main_file_picker_body.dart';
import 'platform_file_picker_widget.dart';

class MaterialFilePickerWidget extends PlatformFilePickerWidget {
  const MaterialFilePickerWidget({
    required super.height,
    required super.width,
    required super.iconSize,
    required super.pickFile,
    required super.openFileMessage,
    required super.messageSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MainFilePickerBody(
        height: height,
        width: width,
        platformIconButton: IconButton(
          onPressed: pickFile,
          icon: Icon(
            Icons.file_upload_outlined,
            size: iconSize,
          ),
        ),
        openFileMessage: openFileMessage,
        platformMessageTheme: Theme.of(context).textTheme.bodyText2!.copyWith(
              fontSize: messageSize,
            ),
      );
}
