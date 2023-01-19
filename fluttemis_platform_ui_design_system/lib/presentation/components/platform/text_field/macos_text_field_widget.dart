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
    super.onChanged,
    super.suffixIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MacosTextField(
        controller: controller,
        autofocus: autoFocus!,
        showCursor: showCursor,
        prefix: prefixIcon,
        style: MacosTheme.of(context).typography.caption1.copyWith(
              fontSize: fontSize,
            ),
        decoration: kDefaultFocusedBorderDecoration.copyWith(
          border: Border.all(
            color: const Color.fromARGB(59, 103, 103, 103),
          ),
        ),
        placeholder: hintText,
        onChanged: onChanged,
        suffix: suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.only(
                  top: 2,
                  bottom: 2,
                  left: 6,
                  right: 6,
                ),
                child: MacosIconTheme(
                  data: MacosIconThemeData(
                    color: MacosTheme.of(context).brightness.isDark
                        ? const Color.fromRGBO(255, 255, 255, 0.55)
                        : const Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                  child: suffixIcon!,
                ),
              )
            : null,
      );
}
