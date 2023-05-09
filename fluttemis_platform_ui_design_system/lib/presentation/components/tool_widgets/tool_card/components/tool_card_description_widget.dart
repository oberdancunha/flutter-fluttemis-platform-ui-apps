import 'package:flutter/widgets.dart';

import '../../../platform/text/platform_text_widget.dart';
import '../../../platform/text/text_style/caption_text_style.dart';

class ToolCardDescriptionWidget extends StatelessWidget {
  final String? description;
  final double width;

  const ToolCardDescriptionWidget({
    required this.width,
    this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Visibility(
        visible: description != null,
        child: PlatformTextWidget(
          description!,
          fontSize: width,
          textAlign: TextAlign.start,
          textStyle: CaptionTextStyle(context),
        ),
      );
}
