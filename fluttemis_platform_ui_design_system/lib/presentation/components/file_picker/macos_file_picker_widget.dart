import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'main_file_picker_body.dart';
import 'platform_file_picker_widget.dart';

class MacosFilePickerWidget extends PlatformFilePickerWidget {
  const MacosFilePickerWidget({
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
        platformIconButton: MacosIconButton(
          icon: MacosIcon(
            CupertinoIcons.arrow_up_to_line_alt,
            size: iconSize,
          ),
          onPressed: pickFile,
        ),
        openFileMessage: openFileMessage,
        platformMessageTheme: MacosTheme.of(context).typography.body.copyWith(
              fontSize: messageSize,
            ),
      );
}
