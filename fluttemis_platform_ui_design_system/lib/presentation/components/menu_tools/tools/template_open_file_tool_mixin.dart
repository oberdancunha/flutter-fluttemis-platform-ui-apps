import 'package:fluttemis_platform_ui_core/driver/i_file_picker.dart';
import 'package:fluttemis_platform_ui_core/store/access_history/access_history_resource_types_enum.dart';
import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_core/utils/utils.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import 'i_template_tool.dart';

mixin TemplateOpenFileToolMixin<TemplateOpenFileTool extends ITemplateTool>
    on ITemplateToolState<TemplateOpenFileTool> {
  IFilePicker get filePicker => Modular.get<IFilePicker>();

  List<String> get extensionsAccepted;

  late String _filePath;
  set filePath(String filePath) => _filePath = filePath;
  String get filePath => _filePath;

  @override
  Future<void> coreToolAction() async {
    final filePickerPath = await filePicker.filePickerByExtensions(extensionsAccepted);
    if (filePickerPath != null) {
      Modular.get<AccessHistoryStore>().setLastToolAccessed(widget);
      Modular.get<AccessHistoryStore>().setLastResource(
        AccessHistoryResourceTypes.file,
        getFileNameFromPath(filePickerPath),
      );
      filePath = filePickerPath;
    }
  }
}
