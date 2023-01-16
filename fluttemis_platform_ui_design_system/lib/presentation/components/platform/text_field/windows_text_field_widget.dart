import 'package:fluent_ui/fluent_ui.dart';

import 'platform_text_field_widget.dart';

class WindowsTextFieldWidget extends PlatformTextFieldWidget {
  const WindowsTextFieldWidget({
    required super.autoFocus,
    super.controller,
    super.fontSize,
    super.showCursor,
    super.prefixIcon,
    super.hintText,
    super.onChanged,
    super.suffixIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => TextBox(
        controller: controller,
        autofocus: autoFocus!,
        showCursor: showCursor,
        prefix: prefixIcon,
        style: const TextStyle().copyWith(
          fontSize: fontSize,
        ),
        placeholder: hintText,
        onChanged: onChanged,
      );
}
