import 'package:fluttemis_platform_ui_core/domain/value_transformer.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../mixins/clipboard_watcher_mixin.dart';
import '../../platform/color/platform_color.dart';
import '../../platform/icon/icon_type_enum.dart';
import '../../platform/icon/platform_icon_widget.dart';
import '../../platform/tooltip/platform_tooltip_widget.dart';

class OverviewDataSequencesCopyWidget extends StatefulWidget {
  final String sequences;

  const OverviewDataSequencesCopyWidget({
    required this.sequences,
    super.key,
  });

  @override
  State<OverviewDataSequencesCopyWidget> createState() => _OverviewDataSequencesCopyWidgetState();
}

class _OverviewDataSequencesCopyWidgetState extends State<OverviewDataSequencesCopyWidget>
    with ClipboardWatcherMixin<OverviewDataSequencesCopyWidget> {
  late final _sequencesBreakedEvery60Characters = widget.sequences.breakEvery60Characters;

  @override
  Widget build(BuildContext context) {
    final fluttemisAppLocalizations = FluttemisAppLocalizations.of(context)!;

    return ValueListenableBuilder(
      valueListenable: clipboardCopy,
      builder: (_, value, __) => PlatformTooltipWidget(
        message: value == _sequencesBreakedEvery60Characters
            ? fluttemisAppLocalizations.copied
            : fluttemisAppLocalizations.copyAll,
        child: GestureDetector(
          onTap: () async {
            Clipboard.setData(
              ClipboardData(
                text: _sequencesBreakedEvery60Characters,
              ),
            );
          },
          child: PlatformIconWidget(
            iconType: IconType.copy,
            size: 15,
            color:
                value == _sequencesBreakedEvery60Characters ? getPlatformColor(0xFF8B8B8B) : null,
          ),
        ),
      ),
    );
  }
}
