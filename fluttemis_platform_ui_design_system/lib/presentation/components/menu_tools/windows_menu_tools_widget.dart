import 'package:fluent_ui/fluent_ui.dart';

import 'tool_model.dart';

class WindowsMenuToolsWidget extends StatefulWidget {
  final double maxWidthMenu;
  final double imageSize;
  final double fontSize;
  final List<ToolModel> listToolsModel;

  const WindowsMenuToolsWidget({
    required this.maxWidthMenu,
    required this.imageSize,
    required this.fontSize,
    required this.listToolsModel,
    super.key,
  });

  @override
  State<WindowsMenuToolsWidget> createState() => _WindowsMenuToolsWidgetState();
}

class _WindowsMenuToolsWidgetState extends State<WindowsMenuToolsWidget> {
  late GlobalKey<State<StatefulWidget>> _navigationViewKey;
  late int _currentPage;

  @override
  void initState() {
    super.initState();
    _navigationViewKey = GlobalKey();
    _currentPage = 0;
  }

  @override
  Widget build(BuildContext context) => ScaffoldPage(
        content: NavigationView(
          key: _navigationViewKey,
          pane: NavigationPane(
            size: NavigationPaneSize(
              openMaxWidth: widget.maxWidthMenu,
            ),
            selected: _currentPage,
            onChanged: (currentPage) => setState(() {
              _currentPage = currentPage;
            }),
            displayMode: PaneDisplayMode.compact,
            items: widget.listToolsModel
                .map<NavigationPaneItem>(
                  (toolModel) => PaneItem(
                    title: Text(
                      toolModel.title,
                      style: FluentTheme.of(context).typography.body!.copyWith(
                            fontSize: widget.fontSize,
                          ),
                    ),
                    icon: Image.asset(
                      toolModel.image,
                      fit: BoxFit.cover,
                      cacheWidth: widget.imageSize.toInt(),
                    ),
                    body: toolModel.page,
                    selectedTileColor: ButtonState.all(FluentTheme.of(context).activeColor),
                  ),
                )
                .toList(),
          ),
        ),
      );
}
