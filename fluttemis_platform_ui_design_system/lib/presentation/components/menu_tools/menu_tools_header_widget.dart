import 'package:flutter/widgets.dart';

import '../top_menu_tools/top_menu_tools_widget.dart';

class MenuToolsHeaderWidget extends StatelessWidget {
  final Widget child;

  const MenuToolsHeaderWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopMenuToolsWidget(),
            const SizedBox(height: 15),
            Expanded(child: child),
          ],
        ),
      );
}
