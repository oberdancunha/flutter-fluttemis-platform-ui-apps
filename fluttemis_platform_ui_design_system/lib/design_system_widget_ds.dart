import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import 'presentation/components/platform/app_widget/platform_app_widget.dart';

class DesignSystemWidgetDS extends StatelessWidget {
  const DesignSystemWidgetDS({super.key});

  @override
  Widget build(BuildContext context) => PlatformAppWidget(
        title: 'Fluttemis',
        debugShowCheckedModeBanner: false,
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate,
        localizationsDelegates: FluttemisAppLocalizations.localizationsDelegates,
        supportedLocales: FluttemisAppLocalizations.supportedLocales,
      );
}
