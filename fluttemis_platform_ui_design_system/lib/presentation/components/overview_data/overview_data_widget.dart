import 'package:flutter/widgets.dart';

import '../platform/scrollbar/platform_scrollbar_widget.dart';
import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_style/caption_text_style.dart';
import '../platform/text/text_style/label_text_style.dart';
import '../platform/text/text_style/platform_text_style.dart';

class OverviewDataWidget extends StatefulWidget {
  final String value;
  final String description;
  final String image;
  final PlatformTextStyle? textStyle;

  const OverviewDataWidget({
    required this.value,
    required this.description,
    required this.image,
    this.textStyle,
    super.key,
  });

  @override
  State<OverviewDataWidget> createState() => _OverviewDataWidgetState();
}

class _OverviewDataWidgetState extends State<OverviewDataWidget> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) => SizedBox(
          width: constraints.maxWidth,
          height: 60,
          child: Padding(
            padding: EdgeInsets.zero,
            child: Row(
              children: [
                Image.asset(
                  widget.image,
                  width: 35,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PlatformScrollbarWidget(
                          controller: _controller,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: SingleChildScrollView(
                              physics: const ClampingScrollPhysics(),
                              controller: _controller,
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.only(bottom: 6),
                              child: PlatformTextWidget(
                                widget.value,
                                textStyle: widget.textStyle ?? LabelTextStyle(),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        PlatformTextWidget(
                          widget.description,
                          textStyle: CaptionTextStyle(),
                          fontSize: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
