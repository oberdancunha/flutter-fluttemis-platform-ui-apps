import 'package:flutter/widgets.dart';

import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';
import 'overview_data_model.dart';
import 'overview_data_widget.dart';

class OverviewDataListWidget extends StatefulWidget {
  final String title;
  final List<OverviewDataModel> listOverviewData;
  final List<Widget>? widgets;

  const OverviewDataListWidget({
    required this.title,
    required this.listOverviewData,
    this.widgets,
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
  Widget build(BuildContext context) => SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 35,
              child: PlatformTextWidget(
                widget.title,
                textType: TextType.subTitle,
                fontSize: 15,
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemCount: _allDataWidgets.length,
                padding: const EdgeInsets.all(5),
                controller: _scrollController,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (_, index) {
                  final widgetData = _allDataWidgets[index];

                  if (widgetData is OverviewDataModel) {
                    return OverviewDataWidget(
                      value: widgetData.value,
                      description: widgetData.description,
                      image: widgetData.image,
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
          ],
        ),
      );
}
