import 'package:fluttemis_platform_ui_core/store/access_history/access_history_resource_types_enum.dart';
import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import '../platform/text/platform_text_widget.dart';
import '../platform/text/text_type_enum.dart';
import '../resource_input/resource_input_name_widget.dart';

class ResourceDetailsWidget extends StatelessWidget {
  final AccessHistoryStore accessHistoryStore;

  const ResourceDetailsWidget({
    required this.accessHistoryStore,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
        valueListenable: accessHistoryStore,
        builder: (_, accessHistory, __) {
          if (accessHistory.resourceType != null && accessHistory.resourceDescription != null) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PlatformTextWidget(
                  _getMessageByResourceType(
                    context: context,
                    resourceType: accessHistory.resourceType!,
                  ),
                  textType: TextType.subTitle,
                  fontSize: 13,
                ),
                ResourceInputNameWidget(
                  inputName: " ${accessHistory.resourceDescription!}",
                  fontSize: 13,
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      );

  String _getMessageByResourceType({
    required BuildContext context,
    required AccessHistoryResourceTypes resourceType,
  }) {
    switch (resourceType) {
      case AccessHistoryResourceTypes.file:
        return FluttemisAppLocalizations.of(context)!.fileReading;
      case AccessHistoryResourceTypes.api:
        return FluttemisAppLocalizations.of(context)!.apiReading;
    }
  }
}
