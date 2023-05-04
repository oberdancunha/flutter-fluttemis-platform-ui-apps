import 'package:flutter/widgets.dart';

import '../../tool_icon_widget.dart';

class ToolCardMainIconWidget extends StatelessWidget {
  final String image;
  final double width;

  const ToolCardMainIconWidget({
    required this.image,
    required this.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ToolIconWidget(
        image: image,
        width: width,
      );
}
