import 'package:fluent_ui/fluent_ui.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../tooltip/windows_tooltip_widget.dart';

class WindowsCloseDialogButtonWidget extends StatelessWidget {
  const WindowsCloseDialogButtonWidget({super.key});

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          height: 40,
          width: 40,
          child: WindowsTooltipWidget(
            message: FluttemisAppLocalizations.of(context)!.closeWindow,
            child: Button(
              style: ButtonStyle(
                backgroundColor: ButtonState.resolveWith(
                  (states) {
                    if (states.isHovering || states.isFocused) {
                      return const Color(0XFFDD2622);
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
                    return const Color(0XFFF9DBDD);
                  }

                  return const Color(0XFF050708);
                }),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Icon(
                FluentIcons.clear,
                size: 13,
              ),
            ),
          ),
        ),
      );
}
