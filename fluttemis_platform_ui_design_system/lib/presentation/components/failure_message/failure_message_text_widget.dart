import 'package:flutter/widgets.dart';

import '../platform/container/container_color/error_container_color.dart';
import '../platform/container/platform_container_widget.dart';
import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_style/error_text_style.dart';

class FailureMessageTextWidget extends StatelessWidget {
  final String message;
  final String image;

  const FailureMessageTextWidget({
    required this.message,
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PlatformContainerWidget(
        height: 75,
        width: 420,
        backgroundColor: const ErrorContainerColor()(context),
        child: Row(
          children: [
            SizedBox(
              width: 70,
              child: Center(
                child: Image.asset(
                  'assets/images/file_error/$image',
                  width: 45,
                ),
              ),
            ),
            const PlatformContainerWidget(
              height: 68,
              width: 1,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: PlatformTextWidget(
                message,
                textStyle: ErrorTextStyle(),
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
}
