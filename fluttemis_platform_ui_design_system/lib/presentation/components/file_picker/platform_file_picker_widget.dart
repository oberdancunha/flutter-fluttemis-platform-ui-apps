import 'package:flutter/src/widgets/framework.dart';

import '../../../core/platform_widget.dart';
import 'macos_file_picker_widget.dart';
import 'material_file_picker_widget.dart';
import 'windows_file_picker_widget.dart';

class PlatformFilePickerWidget extends PlatformWidget<MacosFilePickerWidget,
    WindowsFilePickerWidget, MaterialFilePickerWidget> {
  final double height;
  final double width;
  final double iconSize;
  final String openFileMessage;
  final double messageSize;
  final VoidCallback pickFile;

  const PlatformFilePickerWidget({
    required this.height,
    required this.width,
    required this.iconSize,
    required this.pickFile,
    required this.openFileMessage,
    required this.messageSize,
    super.key,
  });

  @override
  MacosFilePickerWidget buildMacosWidget() => MacosFilePickerWidget(
        height: height,
        width: width,
        iconSize: iconSize,
        openFileMessage: openFileMessage,
        messageSize: messageSize,
        pickFile: pickFile,
      );

  @override
  WindowsFilePickerWidget buildWindowsWidget() => WindowsFilePickerWidget(
        height: height,
        width: width,
        iconSize: iconSize,
        openFileMessage: openFileMessage,
        messageSize: messageSize,
        pickFile: pickFile,
      );

  @override
  MaterialFilePickerWidget buildMaterialWidget() => MaterialFilePickerWidget(
        height: height,
        width: width,
        iconSize: iconSize,
        openFileMessage: openFileMessage,
        messageSize: messageSize,
        pickFile: pickFile,
      );
}
