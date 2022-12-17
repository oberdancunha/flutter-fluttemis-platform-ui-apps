import 'package:flutter/widgets.dart';

import '../platform/card/platform_card_widget.dart';
import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';

class OverviewDataWidget extends StatelessWidget {
  final String value;
  final String description;
  final String image;

  const OverviewDataWidget({
    required this.value,
    required this.description,
    required this.image,
    super.key,
  });

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
                    image,
                    width: 35,
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PlatformTextWidget(
                        value,
                        textType: TextType.label,
                        fontSize: 13,
                      ),
                      PlatformTextWidget(
                        description,
                        textType: TextType.caption,
                        fontSize: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
