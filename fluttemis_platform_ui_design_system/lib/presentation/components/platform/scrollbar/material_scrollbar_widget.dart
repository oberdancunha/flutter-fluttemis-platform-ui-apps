import 'package:flutter/material.dart';

import 'platform_scrollbar_widger.dart';

class MaterialScrollbarWidget extends PlatformScrollbarWidget {
  const MaterialScrollbarWidget({
    required super.controller,
    required super.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scrollbar(
        controller: controller,
        child: child,
      );
}
