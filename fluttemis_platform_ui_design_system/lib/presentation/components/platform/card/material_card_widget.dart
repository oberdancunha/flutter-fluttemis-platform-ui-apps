import 'package:flutter/material.dart';

import '../container/material_container_widget.dart';
import 'platform_card_widget.dart';

class MaterialCardWidget extends PlatformCardWidget {
  const MaterialCardWidget({
    required super.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => MaterialContainerWidget(
        backgroundColor: Theme.of(context).backgroundColor,
        borderColor: Theme.of(context).primaryColor,
        child: child,
      );
}
