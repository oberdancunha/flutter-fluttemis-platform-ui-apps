import 'package:flutter/widgets.dart';

import '../menu_title/menu_title_widget.dart';
import 'tools/genbank_tool_widget.dart';

class MenuToolsWidget extends StatelessWidget {
  const MenuToolsWidget({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              MenuTitleWidget(),
              SizedBox(height: 20),
              SizedBox(
                height: 260,
                width: 260,
                child: GenbankToolWidget(),
              ),
            ],
          ),
        ),
      );
}
