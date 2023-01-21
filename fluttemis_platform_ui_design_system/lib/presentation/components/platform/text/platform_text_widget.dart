import '../core/platform_widget.dart';
import 'macos_text_widget.dart';
import 'material_text_widget.dart';
import 'text_type_enum.dart';
import 'windows_text_widget.dart';

class PlatformTextWidget
    extends PlatformWidget<MacosTextWidget, WindowsTextWidget, MaterialTextWidget> {
  final String text;
  final TextType textType;
  final double fontSize;

  const PlatformTextWidget(
    this.text, {
    required this.textType,
    required this.fontSize,
    super.key,
  });

  @override
  MacosTextWidget buildMacosWidget() => MacosTextWidget(
        text,
        textType: textType,
        fontSize: fontSize,
      );

  @override
  WindowsTextWidget buildWindowsWidget() => WindowsTextWidget(
        text,
        textType: textType,
        fontSize: fontSize,
      );

  @override
  MaterialTextWidget buildMaterialWidget() => MaterialTextWidget(
        text,
        textType: textType,
        fontSize: fontSize,
      );
}
