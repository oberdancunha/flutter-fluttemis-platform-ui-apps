import '../core/platform_widget.dart';
import 'macos_text_widget.dart';
import 'material_text_widget.dart';
import 'windows_text_widget.dart';

class PlatformTextWidget
    extends PlatformWidget<MacosTextWidget, WindowsTextWidget, MaterialTextWidget> {
  final String text;

  const PlatformTextWidget(
    this.text, {
    super.key,
  });

  @override
  MacosTextWidget buildMacosWidget() => MacosTextWidget(text);

  @override
  WindowsTextWidget buildWindowsWidget() => WindowsTextWidget(text);

  @override
  MaterialTextWidget buildMaterialWidget() => MaterialTextWidget(text);
}
