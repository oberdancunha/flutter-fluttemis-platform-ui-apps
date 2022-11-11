import 'package:flutter/material.dart';

import 'platform_text_widget.dart';

class MaterialTextWidget extends PlatformTextWidget {
  const MaterialTextWidget(
    super.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: Theme.of(context).textTheme.subtitle1,
      );
}
