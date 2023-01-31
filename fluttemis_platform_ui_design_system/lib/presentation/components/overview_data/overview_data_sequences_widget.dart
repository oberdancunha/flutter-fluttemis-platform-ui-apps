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
  final String title;
  final String sequences;

  const OverviewDataSequencesWidget({
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
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlatformTextWidget(
            widget.title,
            textType: TextType.subTitle,
            fontSize: 13,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SizedBox(
                height: 80,
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
                        fontSize: 11.5,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              PlatformTooltipWidget(
                message: FluttemisAppLocalizations.of(context)!.copy,
                child: GestureDetector(
                  onTap: () {
                    Clipboard.setData(
                      ClipboardData(
                        text: widget.sequences,
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
