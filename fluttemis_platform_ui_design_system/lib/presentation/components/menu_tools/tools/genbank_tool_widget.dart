import 'package:fluttemis_platform_ui_core/driver/i_file_picker.dart';
import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../../platform/icon/icon_type_enum.dart';
import '../../platform/tool_card/platform_tool_card_widget.dart';

class GenbankToolWidget extends StatefulWidget {
  final IFilePicker filePicker;

  const GenbankToolWidget({
    required this.filePicker,
    super.key,
  });

  @override
  State<GenbankToolWidget> createState() => _GenbankToolWidgetState();
}

class _GenbankToolWidgetState extends State<GenbankToolWidget> {
  late List<String> genbankExtensionsAccepted;

  @override
  void initState() {
    super.initState();
    genbankExtensionsAccepted = ['genbank', 'gbk', 'gb', 'gbff'];
  }

  @override
  Widget build(BuildContext context) => PlatformToolCardWidget(
        image: 'assets/images/ncbi.png',
        mainTitle: 'Genbank',
        secondaryTitle: FluttemisAppLocalizations.of(context)!.openFile,
        description: FluttemisAppLocalizations.of(context)!.genbankDescription,
        mainDescriptionExtend: genbankExtensionsAccepted.join(', '),
        secondaryDescriptionExtend: FluttemisAppLocalizations.of(context)!.toolAcceptedExtensions,
        toolActionButtonIconType: IconType.openFile,
        toolActionButtonDescription: FluttemisAppLocalizations.of(context)!.openFile,
        toolAction: () async {
          final filePath =
              await widget.filePicker.filePickerByExtensions(genbankExtensionsAccepted);
          if (filePath != null) {
            Modular.get<AccessHistoryStore>().setLastToolAccessed(widget);
            Modular.to.popAndPushNamed('/genbankfile/', arguments: filePath);
          }
        },
      );
}
