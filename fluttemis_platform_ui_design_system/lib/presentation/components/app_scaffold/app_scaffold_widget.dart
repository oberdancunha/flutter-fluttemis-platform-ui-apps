import 'package:fluttemis_platform_ui_core/utils/constants.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../platform/scaffold/platform_scaffold_widget.dart';
import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_style/title_text_style.dart';

class AppScaffoldWidget extends StatelessWidget {
  final Widget body;

  const AppScaffoldWidget({
    required this.body,
    super.key,
  });

  static const titleSize = 15.0;

  @override
  Widget build(BuildContext context) => MoveWindow(
        child: PlatformScaffoldWidget(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/fluttemis.png', width: titleSize),
              const SizedBox(width: 10),
              PlatformTextWidget(
                kAppTitle,
                textStyle: TitleTextStyle(),
                fontSize: titleSize,
              ),
            ],
          ),
          body: body,
        ),
      );
}
