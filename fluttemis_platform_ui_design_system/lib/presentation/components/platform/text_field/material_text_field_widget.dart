import 'package:flutter/material.dart';

import 'platform_text_field_widget.dart';

class MaterialTextFieldWidget extends PlatformTextFieldWidget {
  const MaterialTextFieldWidget({
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
  Widget build(BuildContext context) => TextField(
        controller: controller,
        autofocus: autoFocus!,
        showCursor: showCursor,
        style: Theme.of(context).textTheme.caption!.copyWith(
              fontSize: fontSize,
            ),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          contentPadding: const EdgeInsets.only(top: 15),
          hintText: hintText,
          suffixIcon: suffixIcon,
        ),
        onChanged: onChanged,
      );
}
