import 'package:fluent_ui/fluent_ui.dart';

import 'platform_scaffold_widget.dart';

class WindowsScaffoldWidget extends PlatformScaffoldWidget {
  const WindowsScaffoldWidget({
    required super.title,
    required super.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ScaffoldPage(
        header: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title,
            ],
          ),
        ),
        content: body,
      );
}
