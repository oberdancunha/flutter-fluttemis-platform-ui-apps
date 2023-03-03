import 'package:fluttemis_platform_ui_core/domain/core/value_transformer.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../mixins/clipboard_watcher_mixin.dart';
import '../../platform/color/platform_color.dart';
import '../../platform/icon/icon_type_enum.dart';
import '../../platform/icon/platform_icon.dart';

class OverviewDataSequencesCopySelectableWidget extends StatefulWidget {
  final int sequencesLength;
  final ScrollController scrollController;
  final Widget child;

  const OverviewDataSequencesCopySelectableWidget({
    required this.sequencesLength,
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
    super.dispose();
  }

  void _selectionChangeListener() {
    _sequencesSelected.value = _selectionController.getSelection()?.text?.removeWhiteSpace ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final fluttemisAppLocalizations = FluttemisAppLocalizations.of(context)!;

    return ValueListenableBuilder(
      valueListenable: clipboardCopy,
      builder: (_, clipboardValue, __) {
        String sequencesCopiedWithoutBreaks = "";
        if (clipboardValue.isNotEmpty) {
          sequencesCopiedWithoutBreaks = clipboardValue.removeBreaks;
          final String sequencesCopiedSameAsShown =
              sequencesCopiedWithoutBreaks.insertInnerWhiteSpace;
          final start = _selectionController.getContainedText().indexOf(sequencesCopiedSameAsShown);
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

            return SizedBox(
              height: (widget.sequencesLength / 64) * 10 + 50,
              child: Selectable(
                selectWordOnDoubleTap: true,
                scrollController: widget.scrollController,
                selectionController: _selectionController,
                selectionColor: getPlatformColor(isSequencesCopied ? 0x73F44336 : 0x702195F3),
                popupMenuItems: [
                  SelectableMenuItem(
                    type: SelectableMenuItemType.copy,
                    icon: getPlatformIcon(IconType.copy),
                    title: isSequencesCopied
                        ? fluttemisAppLocalizations.copied
                        : fluttemisAppLocalizations.copySelected,
                    isEnabled: (controller) => controller!.isTextSelected,
                    handler: (controller) {
                      final selectedSequencesWithoutSpaces =
                          controller!.getSelection()!.text!.removeWhiteSpace;
                      final selectedSequencesBreakedEvery60Characters =
                          selectedSequencesWithoutSpaces.breakEvery60Characters;
                      Clipboard.setData(
                        ClipboardData(
                          text: selectedSequencesBreakedEvery60Characters,
                        ),
                      );

                      return true;
                    },
                  ),
                ],
                child: widget.child,
              ),
            );
          },
        );
      },
    );
  }
}
