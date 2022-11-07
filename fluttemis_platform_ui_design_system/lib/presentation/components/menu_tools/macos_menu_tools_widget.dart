import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import '../../../theme/light/macos_theme_data_light.dart';
import 'tool_model.dart';

class MacosMenuToolsWidget extends StatefulWidget {
  final double maxWidthMenu;
  final double imageSize;
  final double fontSize;
  final List<ToolModel> listToolsModel;

  const MacosMenuToolsWidget({
    required this.maxWidthMenu,
    required this.imageSize,
    required this.fontSize,
    required this.listToolsModel,
    super.key,
  });

  @override
  State<MacosMenuToolsWidget> createState() => _MacosMenuToolsWidgetState();
}

class _MacosMenuToolsWidgetState extends State<MacosMenuToolsWidget> {
  late GlobalKey<State<StatefulWidget>> _navigationViewKey;
  late int _currentIndex;
  late bool _isClosed;
  late double _maxWidthMenu;
  late int _adjustClosedMenuWidth;

  @override
  void initState() {
    super.initState();
    _navigationViewKey = GlobalKey();
    _currentIndex = 0;
    _isClosed = true;
    _adjustClosedMenuWidth = 48;
    _maxWidthMenu = _resizeClosedMenu();
  }

  double _resizeClosedMenu() => widget.imageSize + _adjustClosedMenuWidth;

  double _resizeMainWindow(BuildContext context) =>
      MediaQuery.of(context).size.width - _maxWidthMenu;

  @override
  Widget build(BuildContext context) {
    final fluttemisAppLocalizations = FluttemisAppLocalizations.of(context)!;

    return MacosWindow(
      sidebar: Sidebar(
        key: _navigationViewKey,
        topOffset: 10,
        minWidth: _maxWidthMenu,
        maxWidth: _maxWidthMenu,
        startWidth: _maxWidthMenu,
        isResizable: false,
        top: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: MacosTooltip(
              message: _isClosed
                  ? fluttemisAppLocalizations.openMenu
                  : fluttemisAppLocalizations.closeMenu,
              child: MacosIconButton(
                onPressed: () {
                  setState(() => _isClosed = !_isClosed);
                  _maxWidthMenu = _isClosed ? _resizeClosedMenu() : widget.maxWidthMenu;
                },
                icon: const MacosIcon(CupertinoIcons.bars),
                boxConstraints: MacosTheme.of(context).iconButtonTheme.boxConstraints!,
              ),
            ),
          ),
        ),
        builder: (_, __) => SidebarItems(
          items: widget.listToolsModel
              .map(
                (toolModel) => SidebarItem(
                  leading: _isClosed
                      ? MacosTooltip(
                          message: toolModel.title,
                          child: MacosImageIcon(
                            AssetImage(toolModel.image),
                            size: widget.imageSize,
                          ),
                        )
                      : MacosImageIcon(
                          AssetImage(toolModel.image),
                          size: widget.imageSize,
                        ),
                  label: Visibility(
                    visible: !_isClosed,
                    child: Text(
                      toolModel.title,
                      style: MacosTheme.of(context).typography.title3.copyWith(
                            fontSize: widget.fontSize,
                          ),
                    ),
                  ),
                  semanticLabel: toolModel.title,
                ),
              )
              .toList(),
          currentIndex: _currentIndex,
          itemSize: SidebarItemSize.large,
          onChanged: (currentIndex) => setState(() => _currentIndex = currentIndex),
        ),
        decoration: BoxDecoration(
          color: macosThemeDataLightExtension.sidebarBackgroundColor,
        ),
      ),
      endSidebar: Sidebar(
        builder: (_, __) => widget.listToolsModel.elementAt(_currentIndex).page,
        minWidth: _resizeMainWindow(context),
        maxWidth: _resizeMainWindow(context),
        startWidth: _resizeMainWindow(context),
      ),
    );
  }
}
