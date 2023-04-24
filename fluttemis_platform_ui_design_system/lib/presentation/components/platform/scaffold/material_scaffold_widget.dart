import 'package:flutter/material.dart';

import 'platform_scaffold_widget.dart';

class MaterialScaffoldWidget extends PlatformScaffoldWidget {
  const MaterialScaffoldWidget({
    required super.title,
    required super.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Scaffold(
        body: body,
      );
}
