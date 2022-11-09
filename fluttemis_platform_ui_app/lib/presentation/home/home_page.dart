import 'dart:io';

import 'package:fluttemis_platform_ui_design_system/presentation/components/scaffold/platform_scaffold_widget.dart';
import 'package:fluttemis_platform_ui_design_system/presentation/components/text/platform_text_widget.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => PlatformScaffoldWidget(
        body: Center(
          child: PlatformTextWidget('My music no ${Platform.operatingSystem}'),
        ),
      );
}
