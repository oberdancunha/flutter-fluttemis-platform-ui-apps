import 'package:flutter/widgets.dart';

import 'access_history_resource_types_enum.dart';
import 'access_history_state.dart';

class AccessHistoryStore extends ValueNotifier<AccessHistoryState> {
  AccessHistoryStore() : super(AccessHistoryState.initial());

  void setLastToolAccessed(Widget toolAccessed) {
    value = value.copyWith(
      accessHistoryTool: toolAccessed,
    );
  }

  void setLastResource(AccessHistoryResourceTypes resourceType, String resourceDescription) {
    value = value.copyWith(
      resourceType: resourceType,
      resourceDescription: resourceDescription,
    );
  }
}
