import 'package:fluent_ui/fluent_ui.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../tooltip/windows_tooltip_widget.dart';

class WindowsCloseDialogButtonWidget extends StatefulWidget {
  const WindowsCloseDialogButtonWidget({super.key});

  @override
  State<WindowsCloseDialogButtonWidget> createState() => _WindowsCloseDialogButtonWidgetState();
}

class _WindowsCloseDialogButtonWidgetState extends State<WindowsCloseDialogButtonWidget> {
  late bool _onHover;

  @override
  void initState() {
    super.initState();
    _onHover = false;
  }

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.topRight,
        child: SizedBox(
          height: 40,
          width: 40,
          child: FocusableActionDetector(
            onShowHoverHighlight: (onHover) {
              setState(() {
                _onHover = onHover;
              });
            },
            child: WindowsTooltipWidget(
              message: FluttemisAppLocalizations.of(context)!.closeWindow,
              child: Button(
                style: ButtonStyle(
                  backgroundColor: ButtonState.all(
                    _onHover ? const Color.fromARGB(255, 153, 21, 34) : const Color(0XFFC51A2A),
                  ),
                  border: ButtonState.all(
                    const BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  shape: ButtonState.all(
                    const RoundedRectangleBorder(),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  FluentIcons.clear,
                  color: Colors.white,
                  size: 13,
                ),
              ),
            ),
          ),
        ),
      );
}
