import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_scaffold_widget.dart';

class MacosScaffoldWidget extends PlatformScaffoldWidget {
  const MacosScaffoldWidget({
    required super.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MacosWindow(
        child: body,
      );
}
