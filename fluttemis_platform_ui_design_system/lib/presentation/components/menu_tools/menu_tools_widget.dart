import 'package:flutter/widgets.dart';

import '../menu_title/menu_title_widget.dart';
import 'tools/genbank_tool_widget.dart';

class MenuToolsWidget extends StatelessWidget {
  const MenuToolsWidget({super.key});

  @override
  Widget build(BuildContext context) => Column(
        children: [
          const MenuTitleWidget(),
          Expanded(
            child: GridView.count(
              primary: true,
              crossAxisCount: 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(20),
              children: const [
                GenbankToolWidget(),
              ],
            ),
          ),
        ],
      );
}
