import 'package:fluent_ui/fluent_ui.dart';

import 'platform_scaffold_widget.dart';

class WindowsScaffoldWidget extends PlatformScaffoldWidget {
  const WindowsScaffoldWidget({
    required super.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ScaffoldPage(
        content: body,
      );
}
