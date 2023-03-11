import 'package:flutter/widgets.dart';

import '../platform/scrollbar/platform_scrollbar_widget.dart';
import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';

class OverviewMultipleDataListWidget extends StatefulWidget {
  final String title;
  final int dataListLength;
  final List<Widget> children;

  const OverviewMultipleDataListWidget({
    required this.title,
    required this.dataListLength,
    required this.children,
    super.key,
  });

  @override
  State<OverviewMultipleDataListWidget> createState() => _OverviewMultipleDataListWidgetState();
}

class _OverviewMultipleDataListWidgetState extends State<OverviewMultipleDataListWidget> {
  static const _titleHeight = 40.0;
  static const _rowHeight = 50;
  static const _dataPerRow = 3;
  late ScrollController _scrollController;
  late double _height;
  late int _numberOfRowsBasedOnDataPerRow;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _numberOfRowsBasedOnDataPerRow = (widget.dataListLength / _dataPerRow).ceil();
    _height = (_rowHeight * _numberOfRowsBasedOnDataPerRow) + _titleHeight;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final maxHeight = MediaQuery.of(context).size.height * 0.3;

    return SizedBox(
      height: _height < maxHeight ? _height : maxHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: _titleHeight / 2,
            width: double.infinity,
            child: Align(
              alignment: Alignment.centerLeft,
              child: PlatformTextWidget(
                widget.title,
                textType: TextType.subTitle,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(height: _titleHeight / 2),
          Expanded(
            child: PlatformScrollbarWidget(
              controller: _scrollController,
              child: GridView.count(
                crossAxisSpacing: 5,
                crossAxisCount: _dataPerRow,
                mainAxisSpacing: 10,
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
    );
  }
}
