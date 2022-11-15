import '../core/platform_widget.dart';
import 'macos_tool_card_widget.dart';
import 'material_tool_card_widget.dart';
import 'windows_tool_card_widget.dart';

class PlatformToolCardWidget
    extends PlatformWidget<MacosToolCardWidget, WindowsToolCardWidget, MaterialToolCardWidget> {
  final String mainTitle;
  final String secondaryTitle;
  final String description;
  final String image;

  const PlatformToolCardWidget({
    required this.mainTitle,
    required this.secondaryTitle,
    required this.description,
    required this.image,
    super.key,
  });

  @override
  MacosToolCardWidget buildMacosWidget() => MacosToolCardWidget(
        mainTitle: mainTitle,
        secondaryTitle: secondaryTitle,
        description: description,
        image: image,
      );

  @override
  WindowsToolCardWidget buildWindowsWidget() => WindowsToolCardWidget(
        mainTitle: mainTitle,
        secondaryTitle: secondaryTitle,
        description: description,
        image: image,
      );

  @override
  MaterialToolCardWidget buildMaterialWidget() => MaterialToolCardWidget(
        mainTitle: mainTitle,
        secondaryTitle: secondaryTitle,
        description: description,
        image: image,
      );
}
