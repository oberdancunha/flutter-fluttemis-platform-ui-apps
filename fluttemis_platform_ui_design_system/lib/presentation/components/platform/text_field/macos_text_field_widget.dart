import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';

import 'platform_text_field_widget.dart';

class MacosTextFieldWidget extends PlatformTextFieldWidget {
  const MacosTextFieldWidget({
    required super.autoFocus,
    super.controller,
    super.fontSize,
    super.showCursor,
    super.prefixIcon,
    super.hintText,
    super.suffixIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MacosTextField(
        controller: controller,
        autofocus: autoFocus!,
        showCursor: showCursor,
        prefix: prefixIcon,
        style: const TextStyle().copyWith(
          fontSize: fontSize,
        ),
        decoration: kDefaultFocusedBorderDecoration.copyWith(
          border: Border.all(
            color: const Color.fromARGB(59, 103, 103, 103),
          ),
        ),
        placeholder: hintText,
      );
}
