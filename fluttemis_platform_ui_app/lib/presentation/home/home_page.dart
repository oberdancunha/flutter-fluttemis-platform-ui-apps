import 'package:fluttemis_platform_ui_design_system/presentation/components/app_scaffold/app_scaffold_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/menu_tools/menu_tools_widget.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => AppScaffoldWidget(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: MenuToolsWidget(),
            ),
          ),
        ),
      );
}
