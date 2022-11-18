import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';
import '../platform/tool_card/platform_tool_card_widget.dart';

class MenuToolsWidget extends StatelessWidget {
  const MenuToolsWidget({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: PlatformTextWidget(
                FluttemisAppLocalizations.of(context)!.mainMenu,
                textType: TextType.title,
                fontSize: MediaQuery.of(context).size.width / 35,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              primary: true,
              crossAxisCount: 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(20),
              children: [
                PlatformToolCardWidget(
                  mainTitle: 'Genbank',
                  secondaryTitle: FluttemisAppLocalizations.of(context)!.openFile,
                  description: FluttemisAppLocalizations.of(context)!.genbankDescription,
                  image: 'assets/images/ncbi.png',
                ),
              ],
            ),
          ),
        ],
      );
}
