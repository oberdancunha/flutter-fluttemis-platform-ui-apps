import 'package:fluent_ui/fluent_ui.dart';

import 'platform_text_widget.dart';

class WindowsTextWidget extends PlatformTextWidget {
  const WindowsTextWidget(
    super.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: FluentTheme.of(context).typography.subtitle,
      );
}
