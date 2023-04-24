import 'dart:io';

import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import 'presentation/core/app_module.dart';
import 'presentation/core/app_widget.dart';

Future<void> main() async {
  if (!(Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    exit(0);
  }
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  const minimumSize = Size(1024, 640);
  windowManager
    ..setMinimumSize(minimumSize)
    ..setSize(minimumSize);
  doWhenWindowReady(() {
    appWindow.minSize = minimumSize;
    appWindow.size = minimumSize;
    appWindow.alignment = Alignment.center;
    appWindow.show();
  });
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
