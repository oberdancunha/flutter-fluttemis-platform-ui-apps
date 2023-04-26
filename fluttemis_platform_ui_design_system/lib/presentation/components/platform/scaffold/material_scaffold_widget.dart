import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/material.dart';

import '../window_button/material/material_change_window_button_widget.dart';
import '../window_button/material/material_close_window_button_widget.dart';
import 'platform_scaffold_widget.dart';

class MaterialScaffoldWidget extends PlatformScaffoldWidget {
  const MaterialScaffoldWidget({
    required super.title,
    required super.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: body,
        appBar: AppBar(
          title: title,
          centerTitle: true,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          toolbarHeight: 35,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 30, top: 4, bottom: 4),
              child: Row(
                children: [
                  MaterialChangeWindowButtonWidget(
                    icon: Icons.minimize_outlined,
                    message: FluttemisAppLocalizations.of(context)!.minimize,
                    onPressed: () => appWindow.minimize(),
                  ),
                  const SizedBox(width: 10),
                  MaterialChangeWindowButtonWidget(
                    icon: appWindow.isMaximized
                        ? Icons.close_fullscreen_outlined
                        : Icons.fullscreen_outlined,
                    message: appWindow.isMaximized
                        ? FluttemisAppLocalizations.of(context)!.restoreSize
                        : FluttemisAppLocalizations.of(context)!.maximize,
                    onPressed: () => appWindow.maximizeOrRestore(),
                  ),
                  const SizedBox(width: 10),
                  MaterialCloseWindowButtonWidget(
                    message: FluttemisAppLocalizations.of(context)!.closeApplication,
                    onPressed: () => appWindow.close(),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
