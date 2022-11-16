import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../platform/tool_card/platform_tool_card_widget.dart';

class MenuToolsWidget extends StatelessWidget {
  const MenuToolsWidget({super.key});

  @override
  Widget build(BuildContext context) => GridView.count(
        primary: true,
        crossAxisCount: 5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.55,
        padding: const EdgeInsets.all(20),
        children: [
          PlatformToolCardWidget(
            mainTitle: 'Genbank',
            secondaryTitle: FluttemisAppLocalizations.of(context)!.openFile,
            description: FluttemisAppLocalizations.of(context)!.genbankDescription,
            image: 'assets/images/ncbi.png',
          ),
        ],
      );
}
