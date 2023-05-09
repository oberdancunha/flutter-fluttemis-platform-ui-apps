import 'package:fluttemis_platform_ui_core/domain/value_transformer.dart';
import 'package:fluttemis_platform_ui_core/utils/debouncer.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../mixins/clipboard_watcher_mixin.dart';
import '../../platform/color/platform_color.dart';

class OverviewDataSequencesCopySelectableWidget extends StatefulWidget {
  final ScrollController scrollController;
  final Widget child;

  const OverviewDataSequencesCopySelectableWidget({
    required this.scrollController,
    required this.child,
    super.key,
  });

  @override
  State<OverviewDataSequencesCopySelectableWidget> createState() =>
      _OverviewDataSequencesCopySelectableWidgetState();
}

class _OverviewDataSequencesCopySelectableWidgetState
    extends State<OverviewDataSequencesCopySelectableWidget> with ClipboardWatcherMixin {
  late SelectableController _selectionController;
  late final _sequencesSelected = ValueNotifier<String>('');
  final _debouncer = Debouncer(milliseconds: 1500);

  @override
  void initState() {
    super.initState();
    _selectionController = SelectableController();
    _selectionController.addListener(_selectionChangeListener);
  }

  @override
  void dispose() {
    _selectionController
      ..removeListener(_selectionChangeListener)
      ..dispose();
    _sequencesSelected.dispose();
    super.dispose();
  }

  void _selectionChangeListener() {
    _sequencesSelected.value = _selectionController.getSelection()?.text?.removeWhiteSpace ?? '';
    _debouncer.run(_clipboardSelectableSequence);
  }

  void _clipboardSelectableSequence() {
    final selectedSequencesWithoutSpaces =
        _selectionController.getSelection()!.text!.removeWhiteSpace;
    final selectedSequencesBreakedEvery60Characters =
        selectedSequencesWithoutSpaces.breakEvery60Characters;
    Clipboard.setData(
      ClipboardData(
        text: selectedSequencesBreakedEvery60Characters,
      ),
    );
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: clipboardCopy,
        builder: (_, clipboardValue, __) {
          String sequencesCopiedWithoutBreaks = "";
          if (clipboardValue.isNotEmpty) {
            sequencesCopiedWithoutBreaks = clipboardValue.removeBreaks;
            final String sequencesCopiedSameAsShown =
                sequencesCopiedWithoutBreaks.insertInnerWhiteSpace;
            final start =
                _selectionController.getContainedText().indexOf(sequencesCopiedSameAsShown);
            final end = start + sequencesCopiedSameAsShown.length;
            if (start > -1) {
              _selectionController.selectWordsBetweenIndexes(
                start,
                end,
              );
            }
          }

          return ValueListenableBuilder(
            valueListenable: _sequencesSelected,
            builder: (_, sequencesSelected, __) {
              final isSequencesCopied = sequencesCopiedWithoutBreaks == sequencesSelected;

              return Selectable(
                selectWordOnDoubleTap: true,
                scrollController: widget.scrollController,
                selectionController: _selectionController,
                selectionColor: PlatformColor(isSequencesCopied ? 0x73F44336 : 0x702195F3)(),
                showPopup: false,
                child: widget.child,
              );
            },
          );
        },
      );
}
