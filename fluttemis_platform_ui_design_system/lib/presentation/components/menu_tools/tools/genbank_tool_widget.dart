import 'package:fluttemis_platform_ui_core/driver/i_file_picker.dart';
import 'package:fluttemis_platform_ui_core/store/access_history/access_history_resource_types_enum.dart';
import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_core/utils/utils.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../../platform/icon/icon_type_enum.dart';
import 'i_template_tool.dart';

class GenbankToolWidget extends ITemplateTool {
  final IFilePicker filePicker;

  const GenbankToolWidget({
    required this.filePicker,
    super.key,
  });

  @override
  State<GenbankToolWidget> createState() => _GenbankToolWidgetState();
}

class _GenbankToolWidgetState extends ITemplateToolState<GenbankToolWidget> {
  late List<String> genbankExtensionsAccepted;

  @override
  void initState() {
    super.initState();
    genbankExtensionsAccepted = ['genbank', 'gbk', 'gb', 'gbff'];
  }

  @override
  String get image => 'assets/images/ncbi.png';

  @override
  String get mainTitle => 'Genbank';

  @override
  String get secondaryTitle => FluttemisAppLocalizations.of(context)!.openFile;

  @override
  String? get description => FluttemisAppLocalizations.of(context)!.genbankDescription;

  @override
  String? get mainDescriptionExtend => genbankExtensionsAccepted.join(', ');

  @override
  String? get secondaryDescriptionExtend =>
      FluttemisAppLocalizations.of(context)!.toolAcceptedExtensions;

  @override
  IconType? get toolActionButtonIconType => IconType.openFile;

  @override
  String? get toolActionButtonDescription => FluttemisAppLocalizations.of(context)!.openFile;

  @override
  VoidCallback? get toolAction => () async {
        final filePath = await widget.filePicker.filePickerByExtensions(genbankExtensionsAccepted);
        if (filePath != null) {
          Modular.get<AccessHistoryStore>().setLastToolAccessed(widget);
          Modular.get<AccessHistoryStore>().setLastResource(
            AccessHistoryResourceTypes.file,
            getFileNameFromPath(filePath),
          );
          Modular.to.popAndPushNamed('/genbankfile/', arguments: filePath);
        }
      };
}
