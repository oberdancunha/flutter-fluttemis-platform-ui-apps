import 'package:flutter/widgets.dart';

import 'data_table_text_search_widget.dart';

class DataTableHeaderWidget extends StatelessWidget {
  final Function(String) onChanged;
  final VoidCallback onClear;

  const DataTableHeaderWidget({
    required this.onChanged,
    required this.onClear,
    super.key,
  });

  @override
  Widget build(BuildContext context) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: 60,
          child: Center(
            child: DataTableTextSearchWidget(),
          ),
        ),
      );
}
