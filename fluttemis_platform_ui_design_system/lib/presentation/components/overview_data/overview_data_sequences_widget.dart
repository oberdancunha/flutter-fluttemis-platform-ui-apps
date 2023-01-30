import 'package:flutter/widgets.dart';

import '../platform/scrollbar/platform_scrollbar_widget.dart';
import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';

class OverviewDataSequencesWidget extends StatefulWidget {
  final String sequences;

  const OverviewDataSequencesWidget({
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
  Widget build(BuildContext context) => SizedBox(
        height: 100,
        width: 670,
        child: PlatformScrollbarWidget(
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: PlatformTextWidget(
                widget.sequences.replaceAllMapped(
                  RegExp(r'(\w{1})'),
                  (match) => '${match[1]} ',
                ),
                textType: TextType.label,
                fontSize: 12,
              ),
            ),
          ),
        ),
      );
}
