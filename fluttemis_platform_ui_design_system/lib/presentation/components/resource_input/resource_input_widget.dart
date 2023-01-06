import 'package:fluttemis_platform_ui_core/store/access_history/access_history_resource_types_enum.dart';
import 'package:fluttemis_platform_ui_core/store/access_history/access_history_store.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import 'resource_input_name_widget.dart';

class ResourceInputWidget extends StatefulWidget {
  const ResourceInputWidget({super.key});

  @override
  State<ResourceInputWidget> createState() => _ResourceInputWidgetState();
}

class _ResourceInputWidgetState extends State<ResourceInputWidget> {
  late AccessHistoryStore _accessHistoryStore;
  String? _resourceDescription;
  AccessHistoryResourceTypes? _resourceType;

  @override
  void initState() {
    super.initState();
    _accessHistoryStore = Modular.get<AccessHistoryStore>();
    _resourceDescription = _accessHistoryStore.value.resourceDescription;
    _resourceType = _accessHistoryStore.value.resourceType;
  }

  @override
  Widget build(BuildContext context) {
    if (_resourceDescription != null && _resourceType != null) {
      final image = _getImageByResourceType(
        resourceType: _resourceType!,
      );

      return SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width / 2,
        child: Row(
          children: [
            Image.asset(
              image,
              width: 25,
            ),
            const SizedBox(width: 7),
            ResourceInputNameWidget(
              inputName: _resourceDescription!,
              fontSize: 13,
            ),
          ],
        ),
      );
    }

    return const SizedBox.shrink();
  }

  String _getImageByResourceType({
    required AccessHistoryResourceTypes resourceType,
  }) {
    switch (resourceType) {
      case AccessHistoryResourceTypes.file:
        return 'assets/images/data/genome_file.png';

      case AccessHistoryResourceTypes.api:
        return 'assets/images/data/genome_api.png';
    }
  }
}
