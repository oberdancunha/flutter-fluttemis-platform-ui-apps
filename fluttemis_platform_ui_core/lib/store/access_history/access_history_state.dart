import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/widgets.dart';

import 'access_history_resource_types_enum.dart';

class AccessHistoryState extends Equatable {
  final Widget? accessHistoryTool;
  final AccessHistoryResourceTypes? resourceType;
  final String? resourceDescription;

  const AccessHistoryState({
    this.accessHistoryTool,
    this.resourceType,
    this.resourceDescription,
  });

  factory AccessHistoryState.initial() => const AccessHistoryState();

  @override
  List<Object?> get props => [
        accessHistoryTool,
        resourceDescription,
      ];

  AccessHistoryState copyWith({
    Widget? accessHistoryTool,
    AccessHistoryResourceTypes? resourceType,
    String? resourceDescription,
  }) =>
      AccessHistoryState(
        accessHistoryTool: accessHistoryTool ?? this.accessHistoryTool,
        resourceType: resourceType ?? this.resourceType,
        resourceDescription: resourceDescription ?? this.resourceDescription,
      );
}
