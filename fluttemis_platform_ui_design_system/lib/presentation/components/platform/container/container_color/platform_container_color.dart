import 'package:flutter/widgets.dart';

import '../../core/platform_style.dart';

abstract class PlatformContainerColor extends PlatformStyle<Color> {
  final BuildContext context;

  const PlatformContainerColor(this.context);
}
