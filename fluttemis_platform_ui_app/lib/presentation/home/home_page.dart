import 'package:fluttemis_platform_ui_design_system/presentation/components/menu_tools/menu_tools_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/platform/scaffold/platform_scaffold_widget.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => const PlatformScaffoldWidget(
        body: Center(
          child: MenuToolsWidget(),
        ),
      );
}
