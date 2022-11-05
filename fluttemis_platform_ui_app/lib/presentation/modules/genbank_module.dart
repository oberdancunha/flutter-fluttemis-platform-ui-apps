import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/material.dart';

import '../file_picker/file_picker_page.dart';

class GenbankModule extends WidgetModule {
  GenbankModule({super.key});

  @override
  List<Bind<Object>> get binds => [];

  @override
  Widget get view => const FilePickerPage(
        openFileMessage: 'Clique para abrir o arquivo Genbank (.genbank, .gbk, .gbff)',
      );
}
