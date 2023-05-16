import 'package:flutter/widgets.dart';

import 'platform.dart';

abstract class PlatformStyleContext<T> {
  const PlatformStyleContext();

  T call(BuildContext context) {
    final currentPlatform = getCurrentPlatform();
    switch (currentPlatform) {
      case CurrentPlatform.isMacOS:
        return getMacosStyle(context);
      case CurrentPlatform.isWindows:
        return getWindowsStyle(context);
      case CurrentPlatform.isLinux:
        return getMaterialStyle(context);
    }
  }

  T getMacosStyle(BuildContext context);

  T getWindowsStyle(BuildContext context);

  T getMaterialStyle(BuildContext context);
}
