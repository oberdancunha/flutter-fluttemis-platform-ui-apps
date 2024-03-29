import 'package:fluent_ui/fluent_ui.dart';

import '../close_dialog_button/close_dialog_by_esc_message_widget.dart';
import '../close_dialog_button/windows_close_dialog_button_widget.dart';
import 'platform_dialog_widget.dart';

class WindowsDialogWidget extends PlatformDialogWidget {
  const WindowsDialogWidget({
    required super.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: calculateArea(context),
        child: ContentDialog(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height,
            maxWidth: MediaQuery.of(context).size.width,
          ),
          style: const ContentDialogThemeData(
            padding: EdgeInsets.zero,
          ),
          content: Column(
            children: [
              SizedBox(
                height: 40,
                child: Stack(
                  alignment: Alignment.center,
                  children: const [
                    CloseDialogByEscMessageWidget(),
                    WindowsCloseDialogButtonWidget(),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: child,
                ),
              ),
            ],
          ),
        ),
      );
}
