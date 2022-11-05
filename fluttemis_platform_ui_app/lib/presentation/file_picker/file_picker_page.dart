import 'package:fluttemis_platform_ui_design_system/presentation/components/file_picker/platform_file_picker_widget.dart';
import 'package:flutter/widgets.dart';

class FilePickerPage extends StatelessWidget {
  final String openFileMessage;

  const FilePickerPage({
    required this.openFileMessage,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PlatformFilePickerWidget(
        height: 200,
        width: 300,
        iconSize: 150,
        openFileMessage: openFileMessage,
        messageSize: 15,
        pickFile: () {},
      );
}
