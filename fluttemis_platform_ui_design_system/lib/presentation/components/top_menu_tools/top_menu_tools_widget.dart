import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../menu_tools/tools/menu_tool_widget.dart';
import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';
import 'top_menu_tool_icon_widget.dart';

class TopMenuToolsWidget extends StatelessWidget {
  const TopMenuToolsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final accessHistoryToolWidget = Modular.get<AccessHistoryStore>().value.accessHistoryTool;

    return SizedBox(
      height: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: PlatformTextWidget(
              FluttemisAppLocalizations.of(context)!.quicklyAccess,
              textType: TextType.subTitle,
              fontSize: 20,
            ),
          ),
          Row(
            children: [
              const TopMenuToolIconWidget(
                child: MenuToolWidget(),
              ),
              const SizedBox(width: 15),
              if (accessHistoryToolWidget != null)
                TopMenuToolIconWidget(
                  child: accessHistoryToolWidget,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
