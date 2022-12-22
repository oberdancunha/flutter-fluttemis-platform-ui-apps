import 'package:flutter/widgets.dart';

import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';

class OverviewMultipleDataItemWidget extends StatelessWidget {
  final String value;
  final String label;
  final Widget representativeWidget;

  const OverviewMultipleDataItemWidget({
    required this.value,
    required this.label,
    required this.representativeWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          representativeWidget,
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlatformTextWidget(
                  value,
                  textType: TextType.label,
                  fontSize: 14,
                ),
                SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(bottom: 6),
                  child: PlatformTextWidget(
                    label,
                    textType: TextType.caption,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
}
