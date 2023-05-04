import 'package:flutter/widgets.dart';

import '../../../platform/icon/icon_type_enum.dart';
import '../../../platform/icon/platform_icon_widget.dart';
import '../../../platform/icon_button/platform_icon_button_widget.dart';

class ToolCardActionButtonWidget extends StatelessWidget {
  final IconType? toolActionButtonIconType;
  final String? toolActionButtonDescription;
  final VoidCallback? toolAction;
  final double height;
  final double width;
  final double topSpacingHeight;
  final double iconSize;
  final double labelFontSize;

  const ToolCardActionButtonWidget({
    required this.height,
    required this.width,
    required this.topSpacingHeight,
    required this.iconSize,
    required this.labelFontSize,
    this.toolActionButtonIconType,
    this.toolActionButtonDescription,
    this.toolAction,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Visibility(
        visible: toolActionButtonIconType != null &&
            toolActionButtonDescription != null &&
            toolAction != null,
        child: Column(
          children: [
            SizedBox(height: topSpacingHeight),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: height * 0.1,
                width: width * 0.6,
                child: PlatformIconButtonWidget(
                  icon: PlatformIconWidget(
                    iconType: toolActionButtonIconType!,
                    size: iconSize,
                  ),
                  label: toolActionButtonDescription!,
                  fontSize: labelFontSize,
                  onPressed: toolAction!,
                ),
              ),
            ),
          ],
        ),
      );
}
