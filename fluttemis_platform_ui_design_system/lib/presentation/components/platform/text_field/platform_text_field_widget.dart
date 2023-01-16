import 'package:flutter/widgets.dart';

import '../core/platform_widget.dart';
import 'macos_text_field_widget.dart';
import 'material_text_field_widget.dart';
import 'windows_text_field_widget.dart';

class PlatformTextFieldWidget
    extends PlatformWidget<MacosTextFieldWidget, WindowsTextFieldWidget, MaterialTextFieldWidget> {
  final TextEditingController? controller;
  final double? fontSize;
  final bool? autoFocus;
  final bool? showCursor;
  final Widget? prefixIcon;
  final String? hintText;
  final Function(String)? onChanged;
  final Widget? suffixIcon;

  const PlatformTextFieldWidget({
    this.controller,
    this.fontSize = 13,
    this.autoFocus = false,
    this.showCursor,
    this.prefixIcon,
    this.hintText,
    this.onChanged,
    this.suffixIcon,
    super.key,
  });

  @override
  MacosTextFieldWidget buildMacosWidget() => MacosTextFieldWidget(
        autoFocus: autoFocus,
        controller: controller,
        fontSize: fontSize,
        showCursor: showCursor,
        prefixIcon: prefixIcon,
        hintText: hintText,
        onChanged: onChanged,
      );

  @override
  WindowsTextFieldWidget buildWindowsWidget() => WindowsTextFieldWidget(
        autoFocus: autoFocus,
        controller: controller,
        fontSize: fontSize,
        showCursor: showCursor,
        prefixIcon: prefixIcon,
        hintText: hintText,
        onChanged: onChanged,
      );

  @override
  MaterialTextFieldWidget buildMaterialWidget() => MaterialTextFieldWidget(
        autoFocus: autoFocus,
        controller: controller,
        fontSize: fontSize,
        showCursor: showCursor,
        prefixIcon: prefixIcon,
        hintText: hintText,
        onChanged: onChanged,
      );
}
