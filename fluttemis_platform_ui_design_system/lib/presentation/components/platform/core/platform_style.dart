import 'package:flutter/widgets.dart';

import 'platform.dart';

abstract class PlatformStyle<T> {
  final BuildContext context;

  const PlatformStyle(this.context);

  T call() {
    final currentPlatform = getCurrentPlatform();
    switch (currentPlatform) {
      case CurrentPlatform.isMacOS:
        return getMacosStyle();
      case CurrentPlatform.isWindows:
        return getWindowsStyle();
      case CurrentPlatform.isLinux:
        return getMaterialStyle();
    }
  }

  T getMacosStyle();

  T getWindowsStyle();

  T getMaterialStyle();
}
