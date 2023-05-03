import 'dart:io';

enum CurrentPlatform {
  isMacOS,
  isWindows,
  isLinux,
}

CurrentPlatform getCurrentPlatform() {
  if (Platform.isMacOS) {
    return CurrentPlatform.isMacOS;
  } else if (Platform.isWindows) {
    return CurrentPlatform.isWindows;
  } else {
    return CurrentPlatform.isLinux;
  }
}
