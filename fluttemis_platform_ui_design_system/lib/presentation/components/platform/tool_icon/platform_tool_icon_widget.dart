import '../core/platform_widget.dart';
import 'macos_tool_icon_widget.dart';
import 'material_tool_icon_widget.dart';
import 'windows_tool_icon_widget.dart';

class PlatformToolIconWidget
    extends PlatformWidget<MacosToolIconWidget, WindowsToolIconWidget, MaterialToolIconWidget> {
  final String image;
  final double width;

  const PlatformToolIconWidget({
    required this.image,
    required this.width,
    super.key,
  });

  @override
  MacosToolIconWidget buildMacosWidget() => MacosToolIconWidget(
        image: image,
        width: width,
      );

  @override
  WindowsToolIconWidget buildWindowsWidget() => WindowsToolIconWidget(
        image: image,
        width: width,
      );

  @override
  MaterialToolIconWidget buildMaterialWidget() => MaterialToolIconWidget(
        image: image,
        width: width,
      );
}
