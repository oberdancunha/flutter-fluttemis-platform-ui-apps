import 'package:fluent_ui/fluent_ui.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../window_button/windows/windows_change_window_button_widget.dart';
import '../window_button/windows/windows_close_window_button_widget.dart';
import 'platform_scaffold_widget.dart';

class WindowsScaffoldWidget extends PlatformScaffoldWidget {
  const WindowsScaffoldWidget({
    required super.title,
    required super.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ScaffoldPage(
        padding: const EdgeInsets.only(top: 10),
        header: SizedBox(
          height: 35,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                title,
                Row(
                  children: [
                    WindowsChangeWindowButtonWidget(
                      tooltip: FluttemisAppLocalizations.of(context)!.minimize,
                      icon: FluentIcons.chrome_minimize,
                      action: () => appWindow.minimize(),
                    ),
                    WindowsChangeWindowButtonWidget(
                      tooltip: appWindow.isMaximized
                          ? FluttemisAppLocalizations.of(context)!.restoreSize
                          : FluttemisAppLocalizations.of(context)!.maximize,
                      icon: appWindow.isMaximized
                          ? FluentIcons.chrome_restore
                          : FluentIcons.square_shape,
                      action: () {
                        appWindow.maximizeOrRestore();
                      },
                    ),
                    WindowsCloseWindowButtonWidget(
                      tooltip: FluttemisAppLocalizations.of(context)!.closeApplication,
                      action: () => appWindow.close(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        content: body,
      );
}
