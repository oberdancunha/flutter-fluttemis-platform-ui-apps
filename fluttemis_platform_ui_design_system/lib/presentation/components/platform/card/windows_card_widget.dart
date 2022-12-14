import 'package:fluent_ui/fluent_ui.dart';

import '../container/windows_container_widget.dart';
import 'platform_card_widget.dart';

class WindowsCardWidget extends PlatformCardWidget {
  const WindowsCardWidget({
    required super.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => WindowsContainerWidget(
        backgroundColor: FluentTheme.of(context).cardColor,
        shadowColor: FluentTheme.of(context).shadowColor,
        child: child,
      );
}
