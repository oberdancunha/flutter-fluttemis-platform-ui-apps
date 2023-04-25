import 'package:fluent_ui/fluent_ui.dart';

import 'windows_window_button_widget.dart';

class WindowsCloseWindowButtonWidget extends StatelessWidget {
  final String tooltip;
  final VoidCallback action;

  const WindowsCloseWindowButtonWidget({
    required this.tooltip,
    required this.action,
    super.key,
  });

  @override
  Widget build(BuildContext context) => WindowsWindowButtonWidget(
        tooltip: tooltip,
        icon: FluentIcons.clear,
        backgroundHovering: const Color(0XFFDD2622),
        foregroundHovering: const Color(0XFFF9DBDD),
        action: action,
      );
}
