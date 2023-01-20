import 'package:flutter/widgets.dart';

import '../platform/scrollbar/platform_scrollbar_widget.dart';
import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';

class OverviewMultipleDataListWidget extends StatefulWidget {
  final String title;
  final List<Widget> children;

  const OverviewMultipleDataListWidget({
    required this.title,
    required this.children,
    super.key,
  });

  @override
  State<OverviewMultipleDataListWidget> createState() => _OverviewMultipleDataListWidgetState();
}

class _OverviewMultipleDataListWidgetState extends State<OverviewMultipleDataListWidget> {
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
        height: 200,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 3,
            left: 8,
            top: 8,
            bottom: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlatformTextWidget(
                widget.title,
                textType: TextType.subTitle,
                fontSize: 15,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: PlatformScrollbarWidget(
                  controller: _scrollController,
                  child: GridView.count(
                    crossAxisSpacing: 5,
                    crossAxisCount: 3,
                    mainAxisSpacing: 20,
                    physics: const ClampingScrollPhysics(),
                    childAspectRatio: 2.23,
                    controller: _scrollController,
                    padding: const EdgeInsets.only(right: 6),
                    children: widget.children,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
