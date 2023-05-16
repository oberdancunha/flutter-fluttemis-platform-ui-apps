import 'package:flutter/widgets.dart';

import '../platform/scrollbar/platform_scrollbar_widget.dart';
import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_style/sub_title_text_style.dart';
import 'overview_data_model.dart';
import 'overview_data_widget.dart';

class OverviewDataListWidget extends StatefulWidget {
  final String title;
  final List<OverviewDataModel> listOverviewData;
  final List<Widget>? widgets;
  final List<Widget>? titleComplementWidgets;

  const OverviewDataListWidget({
    required this.title,
    required this.listOverviewData,
    this.widgets,
    this.titleComplementWidgets,
    super.key,
  });

  @override
  State<OverviewDataListWidget> createState() => _OverviewDataListWidgetState();
}

class _OverviewDataListWidgetState extends State<OverviewDataListWidget> {
  late ScrollController _scrollController;
  late List _allDataWidgets = [];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _allDataWidgets = [
      ...widget.listOverviewData,
      ...widget.widgets ?? [],
    ];
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PlatformTextWidget(
                    widget.title,
                    textStyle: SubTitleTextStyle(),
                    fontSize: 15,
                  ),
                  ...widget.titleComplementWidgets ?? [],
                ],
              ),
            ),
            Expanded(
              child: PlatformScrollbarWidget(
                controller: _scrollController,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemCount: _allDataWidgets.length,
                  padding: const EdgeInsets.only(
                    top: 5,
                    bottom: 5,
                    left: 5,
                    right: 10,
                  ),
                  controller: _scrollController,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (_, index) {
                    final widgetData = _allDataWidgets[index];

                    if (widgetData is OverviewDataModel) {
                      return OverviewDataWidget(
                        value: widgetData.value,
                        description: widgetData.description,
                        image: widgetData.image,
                        textStyle: widgetData.textStyle,
                      );
                    }

                    return LayoutBuilder(
                      builder: (_, constraints) => SizedBox(
                        width: constraints.maxWidth,
                        child: widgetData as Widget,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
}
