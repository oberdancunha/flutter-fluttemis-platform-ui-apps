import 'package:fluent_ui/fluent_ui.dart';

import '../close_dialog_button/close_dialog_by_esc_message_widget.dart';
import '../close_dialog_button/windows_close_dialog_button_widget.dart';
import 'platform_dialog_widget.dart';

class WindowsDialogWidget extends PlatformDialogWidget {
  const WindowsDialogWidget({
    required super.child,
    super.height,
    super.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: calculateArea(context),
        child: ContentDialog(
          constraints: BoxConstraints(
            maxHeight: height ?? MediaQuery.of(context).size.height,
            maxWidth: width ?? MediaQuery.of(context).size.width,
          ),
          style: const ContentDialogThemeData(
            padding: EdgeInsets.zero,
          ),
          content: Stack(
            children: [
              const WindowsCloseDialogButtonWidget(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Stack(
                  children: [
                    const CloseDialogByEscMessageWidget(),
                    child,
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
