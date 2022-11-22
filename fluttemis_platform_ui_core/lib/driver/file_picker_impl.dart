import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import 'i_file_picker.dart';

class FilePickerImpl implements IFilePicker {
  @override
  Future<String?> filePickerByExtensions(List<String> extensions) async {
    final file = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: extensions,
    );
    if (file != null) {
      return file.paths.first!;
    }

    return null;
  }
}
