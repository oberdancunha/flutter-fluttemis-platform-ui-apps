import 'package:fluttemis_platform_ui_core/domain/locus/locus.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/menu_tools/menu_tools_header_widget.dart';
import 'package:flutter/widgets.dart';

import 'locus_resume/locus_resume_header_widget.dart';
import 'locus_resume/locus_resume_widget.dart';

class LocusPage extends StatelessWidget {
  final KtList<Locus> locus;

  const LocusPage({
    required this.locus,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MenuToolsHeaderWidget(
        horizontalReportWidget: LocusResumeHeaderWidget(locus: locus),
        child: LocusResumeWidget(locus: locus),
      );
}
