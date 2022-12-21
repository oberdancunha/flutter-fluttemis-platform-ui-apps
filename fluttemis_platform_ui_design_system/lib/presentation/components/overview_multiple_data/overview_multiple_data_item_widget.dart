import 'package:flutter/widgets.dart';

import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';

class OverviewMultipleDataItemWidget extends StatelessWidget {
  final String value;
  final String label;

  const OverviewMultipleDataItemWidget({
    required this.value,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/data/count_type_locus.png',
            width: 30,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PlatformTextWidget(
                  value,
                  textType: TextType.label,
                  fontSize: 15,
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
