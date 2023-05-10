import 'package:fluttemis_platform_ui_core/domain/value_transformer.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../../platform/font_family/platform_font_family_mono.dart';
import '../../platform/font_family/platform_font_family_mono_size.dart';
import '../../platform/scrollbar/platform_scrollbar_widget.dart';
import '../../platform/text/platform_text_widget.dart';
import '../../platform/text/text_style/caption_text_style.dart';
import '../../platform/text/text_style/label_text_style.dart';
import '../../platform/text/text_style/sub_title_text_style.dart';
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
  late String _sequencesWithInnerWhiteSpace;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _sequencesWithInnerWhiteSpace = widget.sequences.insertInnerWhiteSpace;
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
              textStyle: SubTitleTextStyle(context),
              fontSize: 13,
            ),
            const SizedBox(width: 5),
            PlatformTextWidget(
              '(${fluttemisAppLocalizations.copyExplanation})',
              textStyle: CaptionTextStyle(context),
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
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: PlatformScrollbarWidget(
                    controller: _scrollController,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: OverviewDataSequencesCopySelectableWidget(
                        scrollController: _scrollController,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 11,
                          ),
                          child: PlatformTextWidget(
                            _sequencesWithInnerWhiteSpace,
                            textStyle: LabelTextStyle(context),
                            fontSize: PlatformFontFamilyMonoSize()(),
                            textAlign: TextAlign.start,
                            fontFamily: PlatformFontFamilyMono()(),
                          ),
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
