import 'dart:developer';
import 'dart:io';

import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/file_picker/platform_file_picker_widget.dart';
import 'package:flutter/widgets.dart';

class FilePickerPage extends StatelessWidget {
  final String fileTypeMessage;
  final List<String> allowedExtensions;

  const FilePickerPage({
    required this.fileTypeMessage,
    required this.allowedExtensions,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PlatformFilePickerWidget(
        height: 200,
        width: 300,
        iconSize: 150,
        openFileMessage: FluttemisAppLocalizations.of(context)!.filePicker(
          fileTypeMessage,
          allowedExtensions.join(', '),
        ),
        messageSize: 15,
        pickFile: () async {
          final FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: allowedExtensions,
          );
          if (result != null) {
            final file = File(result.files.single.path!);
            log(file.path);
          }
        },
      );
}
