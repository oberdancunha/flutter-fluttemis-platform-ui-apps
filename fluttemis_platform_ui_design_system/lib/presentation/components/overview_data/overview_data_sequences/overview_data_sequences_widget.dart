import 'package:fluttemis_platform_ui_core/domain/core/value_transformer.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../../platform/scrollbar/platform_scrollbar_widget.dart';
import '../../platform/text/platform_text_widget.dart';
import '../../platform/text/text_type_enum.dart';
import 'overview_data_sequences_copy_selectable_widget.dart';
import 'overview_data_sequences_copy_widget.dart';

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

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
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
                    child: OverviewDataSequencesCopySelectableWidget(
                      scrollController: _scrollController,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: PlatformTextWidget(
                          widget.sequences.insertInnerWhiteSpace,
                          textType: TextType.label,
                          fontSize: 11.5,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 15),
            OverviewDataSequencesCopyWidget(sequences: widget.sequences),
          ],
        ),
      ],
    );
  }
}
