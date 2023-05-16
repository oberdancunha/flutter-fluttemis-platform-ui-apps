import 'package:flutter/widgets.dart';

import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_style/title_text_style.dart';

class DataTableEmptyMessageWidget extends StatelessWidget {
  final String message;

  const DataTableEmptyMessageWidget({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: PlatformTextWidget(
          message,
          fontSize: 17,
          textStyle: TitleTextStyle(),
        ),
      );
}
