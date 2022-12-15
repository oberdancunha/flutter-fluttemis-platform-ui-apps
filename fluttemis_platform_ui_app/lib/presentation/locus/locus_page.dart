import 'package:fluttemis_platform_ui_core/domain/locus/locus.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/top_menu_tools/top_menu_tools_widget.dart';
import 'package:flutter/widgets.dart';

import 'locus_map/locus_map_widget.dart';

class LocusPage extends StatelessWidget {
  final KtList<Locus> locus;

  const LocusPage({
    required this.locus,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TopMenuToolsWidget(),
            SizedBox(height: 15),
            LocusMapWidget(),
          ],
        ),
      );
}
