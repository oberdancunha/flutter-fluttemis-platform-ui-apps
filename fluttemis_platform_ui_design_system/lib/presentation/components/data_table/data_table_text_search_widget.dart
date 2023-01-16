import 'package:flutter/material.dart';

import '../platform/icon/icon_type_enum.dart';
import '../platform/icon/platform_icon_widget.dart';
import '../platform/text_field/platform_text_field_widget.dart';

class DataTableTextSearchWidget extends StatefulWidget {
  final Function(String) onChanged;
  final VoidCallback onClear;
  final String hintText;

  const DataTableTextSearchWidget({
    required this.onChanged,
    required this.onClear,
    required this.hintText,
    super.key,
  });

  @override
  State<DataTableTextSearchWidget> createState() => _DataTableTextSearchWidgetState();
}

class _DataTableTextSearchWidgetState extends State<DataTableTextSearchWidget> {
  late GlobalKey _clearGlobalKey;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _clearGlobalKey = GlobalKey();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PlatformTextFieldWidget(
        controller: _controller,
        autoFocus: true,
        showCursor: true,
        fontSize: 15,
        prefixIcon: const PlatformIconWidget(
          iconType: IconType.search,
          size: 15,
        ),
        hintText: widget.hintText,
        onChanged: widget.onChanged,
        suffixIcon: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            key: _clearGlobalKey,
            onTap: () {
              _controller.clear();
              widget.onClear();
            },
            child: const PlatformIconWidget(
              iconType: IconType.clear,
              size: 15,
            ),
          ),
        ),
      );
}
