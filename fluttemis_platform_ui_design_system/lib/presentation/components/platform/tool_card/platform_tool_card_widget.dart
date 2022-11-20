import 'package:flutter/material.dart';

import '../core/platform_widget.dart';
import 'macos_tool_card_widget.dart';
import 'material_tool_card_widget.dart';
import 'windows_tool_card_widget.dart';

class PlatformToolCardWidget
    extends PlatformWidget<MacosToolCardWidget, WindowsToolCardWidget, MaterialToolCardWidget> {
  final String image;
  final String mainTitle;
  final String secondaryTitle;
  final String? description;
  final String? mainDescriptionExtend;
  final String? secondaryDescriptionExtend;
  final VoidCallback? toolAction;

  const PlatformToolCardWidget({
    required this.image,
    required this.mainTitle,
    required this.secondaryTitle,
    this.description,
    this.mainDescriptionExtend,
    this.secondaryDescriptionExtend,
    this.toolAction,
    super.key,
  });

  @override
  MacosToolCardWidget buildMacosWidget() => MacosToolCardWidget(
        image: image,
        mainTitle: mainTitle,
        secondaryTitle: secondaryTitle,
        description: description,
        mainDescriptionExtend: mainDescriptionExtend,
        secondaryDescriptionExtend: secondaryDescriptionExtend,
        toolAction: toolAction,
      );

  @override
  WindowsToolCardWidget buildWindowsWidget() => WindowsToolCardWidget(
        image: image,
        mainTitle: mainTitle,
        secondaryTitle: secondaryTitle,
        description: description,
        mainDescriptionExtend: mainDescriptionExtend,
        secondaryDescriptionExtend: secondaryDescriptionExtend,
        toolAction: toolAction,
      );

  @override
  MaterialToolCardWidget buildMaterialWidget() => MaterialToolCardWidget(
        image: image,
        mainTitle: mainTitle,
        secondaryTitle: secondaryTitle,
        description: description,
        mainDescriptionExtend: mainDescriptionExtend,
        secondaryDescriptionExtend: secondaryDescriptionExtend,
        toolAction: toolAction,
      );
}
