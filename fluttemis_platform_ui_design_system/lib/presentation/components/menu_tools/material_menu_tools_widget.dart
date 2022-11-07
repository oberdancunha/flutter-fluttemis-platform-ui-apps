import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/material.dart';

import '../../../theme/fluttemis_theme_extension.dart';
import 'tool_model.dart';

class MaterialMenuToolsWidget extends StatefulWidget {
  final double maxWidthMenu;
  final double imageSize;
  final double fontSize;
  final List<ToolModel> listToolsModel;

  const MaterialMenuToolsWidget({
    required this.maxWidthMenu,
    required this.imageSize,
    required this.fontSize,
    required this.listToolsModel,
    super.key,
  });

  @override
  State<MaterialMenuToolsWidget> createState() => _MaterialMenuToolsWidgetState();
}

class _MaterialMenuToolsWidgetState extends State<MaterialMenuToolsWidget> {
  late GlobalKey<State<StatefulWidget>> _navigationViewKey;
  late int _currentPage;
  late bool _isClosed;
  late double _maxWidthMenu;
  late int _adjustClosedMenuWidth;

  @override
  void initState() {
    super.initState();
    _navigationViewKey = GlobalKey();
    _currentPage = 0;
    _isClosed = true;
    _adjustClosedMenuWidth = 30;
    _maxWidthMenu = _resizeClosedMenu();
  }

  double _resizeClosedMenu() => widget.imageSize + _adjustClosedMenuWidth;

  @override
  Widget build(BuildContext context) {
    final themeExtension = Theme.of(context).extension<FluttemisThemeExtension<Color>>()!;
    final fluttemisAppLocalizations = FluttemisAppLocalizations.of(context)!;

    return Scaffold(
      key: _navigationViewKey,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: themeExtension.sidebarBackgroundColor,
            height: MediaQuery.of(context).size.height,
            width: _maxWidthMenu,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 5,
                  ),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Material(
                        color: Colors.transparent,
                        child: SizedBox(
                          width: 38,
                          height: 38,
                          child: Tooltip(
                            message: _isClosed
                                ? fluttemisAppLocalizations.openMenu
                                : fluttemisAppLocalizations.closeMenu,
                            child: IconButton(
                              icon: const Icon(Icons.menu),
                              onPressed: () {
                                setState(() => _isClosed = !_isClosed);
                                _maxWidthMenu =
                                    _isClosed ? _resizeClosedMenu() : widget.maxWidthMenu;
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: widget.listToolsModel.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    final toolModel = widget.listToolsModel.elementAt(index);

                    return InkWell(
                      child: SizedBox(
                        height: widget.imageSize + 20,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            if (_currentPage == index)
                              Container(
                                width: _maxWidthMenu - 10,
                                height: widget.imageSize + 20,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  if (_isClosed)
                                    Tooltip(
                                      message: toolModel.title,
                                      child: Image.asset(
                                        toolModel.image,
                                        cacheWidth: widget.imageSize.toInt(),
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  else ...[
                                    Image.asset(
                                      toolModel.image,
                                      cacheWidth: widget.imageSize.toInt(),
                                      fit: BoxFit.cover,
                                    ),
                                    const SizedBox(width: 10),
                                  ],
                                  Visibility(
                                    visible: !_isClosed,
                                    child: Text(
                                      toolModel.title,
                                      style: Theme.of(context).primaryTextTheme.subtitle2!.copyWith(
                                            fontSize: widget.fontSize,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => setState(() => _currentPage = index),
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(child: widget.listToolsModel.elementAt(_currentPage).page),
        ],
      ),
    );
  }
}
