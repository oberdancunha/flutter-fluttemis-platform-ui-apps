import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../tooltip/macos_tooltip_widget.dart';

class MacosCloseDialogButtonWidget extends StatefulWidget {
  const MacosCloseDialogButtonWidget({super.key});

  @override
  State<MacosCloseDialogButtonWidget> createState() => _MacosCloseDialogButtonWidgetState();
}

class _MacosCloseDialogButtonWidgetState extends State<MacosCloseDialogButtonWidget> {
  late bool _onHover;

  @override
  void initState() {
    super.initState();
    _onHover = false;
  }

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 7,
            top: 7,
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: FocusableActionDetector(
              onShowHoverHighlight: (onHover) {
                setState(() {
                  _onHover = onHover;
                });
              },
              child: MacosTooltipWidget(
                message: FluttemisAppLocalizations.of(context)!.closeWindow,
                child: Container(
                  height: 13,
                  width: 13,
                  decoration: const BoxDecoration(
                    color: MacosColor(0XFFFF555B),
                    shape: BoxShape.circle,
                  ),
                  child: _onHover
                      ? const Center(
                          child: MacosIcon(
                            CupertinoIcons.xmark,
                            color: Color.fromARGB(255, 114, 0, 11),
                            size: 10,
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ),
            ),
          ),
        ),
      );
}
