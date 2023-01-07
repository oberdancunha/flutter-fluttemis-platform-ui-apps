import 'package:fluent_ui/fluent_ui.dart';

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
            maxWidth: MediaQuery.of(context).size.width,
          ),
          content: child,
        ),
      );
}
