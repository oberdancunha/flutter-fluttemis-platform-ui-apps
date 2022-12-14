import 'package:fluttemis_platform_ui_core/domain/locus/locus.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/top_menu_tools/top_menu_tools_widget.dart';
import 'package:flutter/widgets.dart';

import 'locus_map_widget.dart';

class LocusMapPage extends StatelessWidget {
  final KtList<Locus> locus;

  const LocusMapPage({
    required this.locus,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.005),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TopMenuToolsWidget(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.025),
            const LocusMapWidget(),
          ],
        ),
      );
}
