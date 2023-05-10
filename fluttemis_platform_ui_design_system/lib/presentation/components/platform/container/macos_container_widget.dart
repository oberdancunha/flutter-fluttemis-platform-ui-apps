import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'container_color/default_container_color.dart';
import 'platform_container_widget.dart';

class MacosContainerWidget extends PlatformContainerWidget {
  const MacosContainerWidget({
    super.child,
    super.height,
    super.width,
    super.key,
    super.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = MacosTheme.brightnessOf(context);
    const kSheetBorderRadius = BorderRadius.all(Radius.circular(12));

    return DecoratedBox(
      decoration: BoxDecoration(
        color: brightness.resolve(
          CupertinoColors.systemGrey6.color,
          MacosColors.controlBackgroundColor.darkColor,
        ),
        borderRadius: kSheetBorderRadius,
      ),
      child: Container(
        height: height ?? 0,
        width: width ?? 0,
        decoration: BoxDecoration(
          color: backgroundColor ?? DefaultContainerColor(context)(),
          borderRadius: kSheetBorderRadius,
          border: Border.all(
            width: 2,
            color: brightness.resolve(
              MacosColors.white.withOpacity(0.45),
              MacosColors.white.withOpacity(0.15),
            ),
          ),
        ),
        foregroundDecoration: BoxDecoration(
          border: Border.all(
            color: brightness.resolve(
              MacosColors.black.withOpacity(0.23),
              MacosColors.black.withOpacity(0.76),
            ),
          ),
          borderRadius: kSheetBorderRadius,
        ),
        child: child,
      ),
    );
  }
}
