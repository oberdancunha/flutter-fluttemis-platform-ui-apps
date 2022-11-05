import 'package:fluent_ui/fluent_ui.dart';

import 'main_file_picker_body.dart';
import 'platform_file_picker_widget.dart';

class WindowsFilePickerWidget extends PlatformFilePickerWidget {
  const WindowsFilePickerWidget({
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
          icon: Icon(
            FluentIcons.upload,
            size: iconSize,
          ),
          onPressed: pickFile,
        ),
        openFileMessage: openFileMessage,
        platformMessageTheme: FluentTheme.of(context).typography.body!.copyWith(
              fontSize: messageSize,
            ),
      );
}
