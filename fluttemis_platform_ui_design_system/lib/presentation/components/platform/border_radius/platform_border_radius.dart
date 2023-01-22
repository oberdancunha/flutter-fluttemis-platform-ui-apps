import 'package:flutter/rendering.dart';

import '../core/platform.dart';

BorderRadius getPlatformBorderRadiusToDrawFeature(int fearureStrand) {
  final platform = getCurrentPlatform();
  switch (platform) {
    case CurrentPlatform.isMacOS:
      return fearureStrand == 0
          ? const BorderRadius.only(
              topLeft: Radius.circular(2),
              bottomLeft: Radius.circular(2),
            )
          : const BorderRadius.only(
              topRight: Radius.circular(2),
              bottomRight: Radius.circular(2),
            );
    case CurrentPlatform.isWindows:
      return BorderRadius.zero;
    case CurrentPlatform.isLinux:
      return BorderRadius.circular(5);
  }
}
