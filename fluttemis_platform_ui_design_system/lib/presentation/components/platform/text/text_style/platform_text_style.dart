import 'package:flutter/widgets.dart';

import '../../core/platform_style.dart';

abstract class PlatformTextStyle extends PlatformStyle<TextStyle> {
  final BuildContext context;

  const PlatformTextStyle(this.context);
}
