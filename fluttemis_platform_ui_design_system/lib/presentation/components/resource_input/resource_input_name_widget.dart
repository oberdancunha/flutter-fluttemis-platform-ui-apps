import 'package:flutter/widgets.dart';

import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';

class ResourceInputNameWidget extends StatelessWidget {
  final String inputName;
  final double fontSize;

  const ResourceInputNameWidget({
    required this.inputName,
    required this.fontSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) => PlatformTextWidget(
        inputName,
        textType: TextType.title,
        fontSize: fontSize,
      );
}
