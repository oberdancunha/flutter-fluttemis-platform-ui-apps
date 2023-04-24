import 'package:fluttemis_platform_ui_core/utils/constants.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../platform/scaffold/platform_scaffold_widget.dart';
import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';

class AppScaffoldWidget extends StatelessWidget {
  final Widget body;

  const AppScaffoldWidget({
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MoveWindow(
        child: PlatformScaffoldWidget(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/fluttemis.png', width: 15),
              const SizedBox(width: 5),
              const PlatformTextWidget(
                kAppTitle,
                textType: TextType.title,
                fontSize: 13,
              ),
            ],
          ),
          body: body,
        ),
      );
}
