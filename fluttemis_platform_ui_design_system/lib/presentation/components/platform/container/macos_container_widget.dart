import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'container_type.dart';
import 'platform_container_widget.dart';

class MacosContainerWidget extends PlatformContainerWidget {
  const MacosContainerWidget({
    required super.child,
    super.height,
    super.width,
    super.backgroundColor,
    super.containerType,
    super.key,
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
          color: backgroundColor ?? getContainerBackgroundColor(context),
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

  @override
  Color getContainerBackgroundColor(BuildContext context) {
    switch (containerType) {
      case ContainerType.error:
        return MacosTheme.of(context).brightness == Brightness.light
            ? MacosColors.windowFrameColor
            : MacosColors.alternatingContentBackgroundColor;
      case null:
        return MacosTheme.of(context).primaryColor;
    }
  }
}
