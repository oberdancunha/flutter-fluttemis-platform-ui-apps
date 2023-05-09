import 'package:flutter/material.dart';

import '../core/platform_widget.dart';
import '../icon/icon_data/platform_icon_data.dart';
import 'macos_tool_card_widget.dart';
import 'material_tool_card_widget.dart';
import 'windows_tool_card_widget.dart';

class PlatformToolCardWidget
    extends PlatformWidget<MacosToolCardWidget, WindowsToolCardWidget, MaterialToolCardWidget> {
  final String image;
  final String mainTitle;
  final String secondaryTitle;
  final String? description;
  final String? mainHint;
  final String? hintComplement;
  final PlatformIconData? toolActionButtonIconData;
  final String? toolActionButtonDescription;
  final VoidCallback? toolAction;

  const PlatformToolCardWidget({
    required this.image,
    required this.mainTitle,
    required this.secondaryTitle,
    this.description,
    this.mainHint,
    this.hintComplement,
    this.toolActionButtonIconData,
    this.toolActionButtonDescription,
    this.toolAction,
    super.key,
  });

  @override
  MacosToolCardWidget buildMacosWidget() => MacosToolCardWidget(
        image: image,
        mainTitle: mainTitle,
        secondaryTitle: secondaryTitle,
        description: description,
        mainHint: mainHint,
        hintComplement: hintComplement,
        toolActionButtonIconData: toolActionButtonIconData,
        toolActionButtonDescription: toolActionButtonDescription,
        toolAction: toolAction,
      );

  @override
  WindowsToolCardWidget buildWindowsWidget() => WindowsToolCardWidget(
        image: image,
        mainTitle: mainTitle,
        secondaryTitle: secondaryTitle,
        description: description,
        mainHint: mainHint,
        hintComplement: hintComplement,
        toolActionButtonIconData: toolActionButtonIconData,
        toolActionButtonDescription: toolActionButtonDescription,
        toolAction: toolAction,
      );

  @override
  MaterialToolCardWidget buildMaterialWidget() => MaterialToolCardWidget(
        image: image,
        mainTitle: mainTitle,
        secondaryTitle: secondaryTitle,
        description: description,
        mainHint: mainHint,
        hintComplement: hintComplement,
        toolActionButtonIconData: toolActionButtonIconData,
        toolActionButtonDescription: toolActionButtonDescription,
        toolAction: toolAction,
      );
}
