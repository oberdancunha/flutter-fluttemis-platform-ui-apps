import 'package:fluent_ui/fluent_ui.dart';

import 'windows_window_button_widget.dart';

class WindowsChangeWindowButtonWidget extends StatelessWidget {
  final String tooltip;
  final IconData icon;
  final VoidCallback action;

  const WindowsChangeWindowButtonWidget({
    required this.icon,
    required this.tooltip,
    required this.action,
    super.key,
  });

  @override
  Widget build(BuildContext context) => WindowsWindowButtonWidget(
        tooltip: tooltip,
        icon: icon,
        backgroundHovering: FluentTheme.of(context).brightness == Brightness.dark
            ? const Color(0XFF2F2F2F)
            : const Color(0XFFE5E5E5),
        foregroundHovering: FluentTheme.of(context).brightness == Brightness.dark
            ? const Color(0XFF979797)
            : const Color(0XFF1C1C1C),
        action: action,
      );
}
