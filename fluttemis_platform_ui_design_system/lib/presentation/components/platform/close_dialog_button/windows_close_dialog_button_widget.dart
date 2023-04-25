import 'package:fluent_ui/fluent_ui.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../window_button/windows/windows_close_window_button_widget.dart';

class WindowsCloseDialogButtonWidget extends StatelessWidget {
  const WindowsCloseDialogButtonWidget({super.key});

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.topRight,
        child: WindowsCloseWindowButtonWidget(
          tooltip: FluttemisAppLocalizations.of(context)!.closeWindow,
          action: () => Navigator.of(context).pop(),
        ),
      );
}
