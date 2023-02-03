import 'package:fluttemis_platform_ui_core/domain/core/value_transformer.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../platform/icon/icon_type_enum.dart';
import '../platform/icon/platform_icon_widget.dart';
import '../platform/scrollbar/platform_scrollbar_widget.dart';
import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';
import '../platform/tooltip/platform_tooltip_widget.dart';

class OverviewDataSequencesWidget extends StatefulWidget {
  final double height;
  final String title;
  final String sequences;

  const OverviewDataSequencesWidget({
    required this.height,
    required this.title,
    required this.sequences,
    super.key,
  });

  @override
  State<OverviewDataSequencesWidget> createState() => _OverviewDataSequencesWidgetState();
}

class _OverviewDataSequencesWidgetState extends State<OverviewDataSequencesWidget> {
  late ScrollController _scrollController;
  late SelectableController _selectionController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _selectionController = SelectableController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _selectionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final fluttemisAppLocalizations = FluttemisAppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            PlatformTextWidget(
              widget.title,
              textType: TextType.subTitle,
              fontSize: 13,
            ),
            const SizedBox(width: 5),
            PlatformTextWidget(
              '(${fluttemisAppLocalizations.copyExplanation})',
              textType: TextType.caption,
              fontSize: 11,
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SizedBox(
                height: widget.height,
                child: PlatformScrollbarWidget(
                  controller: _scrollController,
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Selectable(
                        selectWordOnDoubleTap: true,
                        selectionController: _selectionController,
                        scrollController: _scrollController,
                        popupMenuItems: [
                          SelectableMenuItem(
                            type: SelectableMenuItemType.copy,
                            title: fluttemisAppLocalizations.copySelected,
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
                        child: PlatformTextWidget(
                          widget.sequences.replaceAllMapped(
                            RegExp(r'(\w{1})'),
                            (match) => '${match[1]} ',
                          ),
                          textType: TextType.label,
                          fontSize: 11.5,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            PlatformTooltipWidget(
              message: fluttemisAppLocalizations.copyAll,
              child: GestureDetector(
                onTap: () {
                  final sequencesBreakedEvery60Characters =
                      breakSequencesEvery60Characters(widget.sequences);
                  Clipboard.setData(
                    ClipboardData(
                      text: sequencesBreakedEvery60Characters,
                    ),
                  );
                },
                child: const PlatformIconWidget(
                  iconType: IconType.copy,
                  size: 15,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
