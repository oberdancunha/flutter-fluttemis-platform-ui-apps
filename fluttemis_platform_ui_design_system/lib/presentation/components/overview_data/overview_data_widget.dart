import 'package:flutter/widgets.dart';

import '../platform/card/platform_card_widget.dart';
import '../platform/scrollbar/platform_scrollbar_widget.dart';
import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';

class OverviewDataWidget extends StatefulWidget {
  final String value;
  final String description;
  final String image;
  final TextType? textType;

  const OverviewDataWidget({
    required this.value,
    required this.description,
    required this.image,
    this.textType,
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
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (_, constraints) => SizedBox(
          width: constraints.maxWidth,
          height: 60,
          child: PlatformCardWidget(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Image.asset(
                    widget.image,
                    width: 35,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
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
                                textType: widget.textType ?? TextType.label,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        PlatformTextWidget(
                          widget.description,
                          textType: TextType.caption,
                          fontSize: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
