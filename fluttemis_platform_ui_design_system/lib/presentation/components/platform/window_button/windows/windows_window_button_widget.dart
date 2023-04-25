import 'package:fluent_ui/fluent_ui.dart';

import '../../tooltip/windows_tooltip_widget.dart';

class WindowsWindowButtonWidget extends StatelessWidget {
  final String tooltip;
  final IconData icon;
  final Color backgroundHovering;
  final Color foregroundHovering;
  final VoidCallback action;

  const WindowsWindowButtonWidget({
    required this.tooltip,
    required this.icon,
    required this.backgroundHovering,
    required this.foregroundHovering,
    required this.action,
    super.key,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 40,
        width: 40,
        child: WindowsTooltipWidget(
          message: tooltip,
          child: Button(
            style: ButtonStyle(
              backgroundColor: ButtonState.resolveWith(
                (states) {
                  if (states.isHovering || states.isFocused) {
                    return backgroundHovering;
                  }

                  return const Color(0x00000000);
                },
              ),
              border: ButtonState.all(
                const BorderSide(
                  color: Colors.transparent,
                ),
              ),
              shape: ButtonState.all(
                const RoundedRectangleBorder(),
              ),
              foregroundColor: ButtonState.resolveWith((states) {
                if (states.isHovering || states.isFocused) {
                  return foregroundHovering;
                }

                return FluentTheme.of(context).iconTheme.color;
              }),
            ),
            onPressed: action,
            child: Icon(
              icon,
              size: 13,
            ),
          ),
        ),
      );
}
