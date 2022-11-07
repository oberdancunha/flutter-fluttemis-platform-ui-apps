import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/menu_tools/platform_menu_tools_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/menu_tools/tool_model.dart';
import 'package:flutter/widgets.dart';

import '../modules/genbank_module.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => PlatformMenuToolsWidget(
        maxWidthMenu: 150,
        imageSize: 18,
        fontSize: 12,
        listToolsModel: [
          ToolModel(
            title: FluttemisAppLocalizations.of(context)!.genbankFile,
            image: 'assets/images/ncbi.png',
            page: Center(
              child: GenbankModule(),
            ),
          ),
        ],
      );
}
