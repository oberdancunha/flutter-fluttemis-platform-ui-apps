import 'package:fluttemis_platform_ui_core/domain/core/value_transformer.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class OverviewDataSequencesCopySelectableWidget extends StatefulWidget {
  final Widget child;
  final ScrollController scrollController;

  const OverviewDataSequencesCopySelectableWidget({
    required this.child,
    required this.scrollController,
    super.key,
  });

  @override
  State<OverviewDataSequencesCopySelectableWidget> createState() =>
      _OverviewDataSequencesCopySelectableWidgetState();
}

class _OverviewDataSequencesCopySelectableWidgetState
    extends State<OverviewDataSequencesCopySelectableWidget> {
  late SelectableController _selectionController;

  @override
  void initState() {
    super.initState();
    _selectionController = SelectableController();
  }

  @override
  void dispose() {
    super.dispose();
    _selectionController.dispose();
  }

  @override
  Widget build(BuildContext context) => Selectable(
        selectWordOnDoubleTap: true,
        selectionController: _selectionController,
        scrollController: widget.scrollController,
        popupMenuItems: [
          SelectableMenuItem(
            type: SelectableMenuItemType.copy,
            title: FluttemisAppLocalizations.of(context)!.copySelected,
            handler: (controller) {
              final selectedSequencesWithoutSpaces =
                  controller!.getSelection()!.text!.replaceAll(' ', '');
              final selectedSequencesBreakedEvery60Characters =
                  breakSequencesEvery60Characters(selectedSequencesWithoutSpaces);
              Clipboard.setData(
                ClipboardData(text: selectedSequencesBreakedEvery60Characters),
              );

              return true;
            },
          ),
        ],
        child: widget.child,
      );
}
