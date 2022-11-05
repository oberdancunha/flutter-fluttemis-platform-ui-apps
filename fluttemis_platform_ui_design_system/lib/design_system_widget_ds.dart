import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'presentation/components/app_widget/platform_app_widget.dart';

class DesignSystemWidgetDS extends StatelessWidget {
  const DesignSystemWidgetDS({super.key});

  @override
  Widget build(BuildContext context) => PlatformAppWidget(
        title: 'Fluttemis platform ui',
        debugShowCheckedModeBanner: false,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
      );
}
