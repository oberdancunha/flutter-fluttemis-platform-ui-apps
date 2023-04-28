import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../../platform/icon/icon_type_enum.dart';
import 'i_template_tool.dart';
import 'template_open_file_tool_mixin.dart';

class GenbankToolWidget extends ITemplateTool {
  const GenbankToolWidget({super.key});

  @override
  State<GenbankToolWidget> createState() => _GenbankToolWidgetState();
}

class _GenbankToolWidgetState extends ITemplateToolState<GenbankToolWidget>
    with TemplateOpenFileToolMixin {
  @override
  String get image => 'assets/images/ncbi.png';

  @override
  String get mainTitle => 'Genbank';

  @override
  String get secondaryTitle => FluttemisAppLocalizations.of(context)!.openFile;

  @override
  String? get description => FluttemisAppLocalizations.of(context)!.genbankDescription;

  @override
  String? get mainDescriptionExtend => extensionsAccepted.join(', ');

  @override
  String? get secondaryDescriptionExtend =>
      FluttemisAppLocalizations.of(context)!.toolAcceptedExtensions;

  @override
  IconType? get toolActionButtonIconType => IconType.openFile;

  @override
  String? get toolActionButtonDescription => FluttemisAppLocalizations.of(context)!.openFile;

  @override
  String get route => '/genbankfile/?filepath=$filePath';

  @override
  List<String> get extensionsAccepted => ['genbank', 'gbk', 'gb', 'gbff'];
}
