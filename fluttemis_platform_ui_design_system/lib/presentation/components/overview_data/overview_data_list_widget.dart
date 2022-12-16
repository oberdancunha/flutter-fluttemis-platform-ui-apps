import 'package:flutter/widgets.dart';

import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';
import 'overview_data_model.dart';
import 'overview_data_widget.dart';

class OverviewDataListWidget extends StatefulWidget {
  final String title;
  final List<OverviewDataModel> listOverviewData;

  const OverviewDataListWidget({
    required this.title,
    required this.listOverviewData,
    super.key,
  });

  @override
  State<OverviewDataListWidget> createState() => _OverviewDataListWidgetState();
}

class _OverviewDataListWidgetState extends State<OverviewDataListWidget> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
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
                itemCount: widget.listOverviewData.length,
                padding: const EdgeInsets.all(5),
                controller: _scrollController,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (_, index) {
                  final overviewData = widget.listOverviewData[index];

                  return OverviewDataWidget(
                    value: overviewData.value,
                    description: overviewData.description,
                    image: overviewData.image,
                  );
                },
              ),
            ),
          ],
        ),
      );
}
