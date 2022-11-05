import '../../../core/platform_widget.dart';
import 'macos_menu_tools_widget.dart';
import 'material_menu_tools_widget.dart';
import 'tool_model.dart';
import 'windows_menu_tools_widget.dart';

class PlatformMenuToolsWidget
    extends PlatformWidget<MacosMenuToolsWidget, WindowsMenuToolsWidget, MaterialMenuToolsWidget> {
  final double maxWidthMenu;
  final double imageSize;
  final double fontSize;
  final List<ToolModel> listToolsModel;

  const PlatformMenuToolsWidget({
    required this.maxWidthMenu,
    required this.imageSize,
    required this.fontSize,
    required this.listToolsModel,
    super.key,
  });

  @override
  MacosMenuToolsWidget buildMacosWidget() => MacosMenuToolsWidget(
        maxWidthMenu: maxWidthMenu,
        imageSize: imageSize,
        fontSize: fontSize,
        listToolsModel: listToolsModel,
      );

  @override
  WindowsMenuToolsWidget buildWindowsWidget() => WindowsMenuToolsWidget(
        maxWidthMenu: maxWidthMenu,
        imageSize: imageSize,
        fontSize: fontSize,
        listToolsModel: listToolsModel,
      );

  @override
  MaterialMenuToolsWidget buildMaterialWidget() => MaterialMenuToolsWidget(
        maxWidthMenu: maxWidthMenu,
        imageSize: imageSize,
        fontSize: fontSize,
        listToolsModel: listToolsModel,
      );
}
