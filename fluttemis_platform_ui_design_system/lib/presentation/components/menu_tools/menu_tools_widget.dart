import 'package:fluttemis_platform_ui_core/driver/i_file_picker.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../menu_title/menu_title_widget.dart';
import 'tools/genbank_tool_widget.dart';

class MenuToolsWidget extends StatelessWidget {
  const MenuToolsWidget({super.key});

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MenuTitleWidget(),
          const SizedBox(height: 20),
          SizedBox(
            height: 240,
            width: 240,
            child: GenbankToolWidget(
              filePicker: Modular.get<IFilePicker>(),
            ),
          ),
        ],
      );
}
