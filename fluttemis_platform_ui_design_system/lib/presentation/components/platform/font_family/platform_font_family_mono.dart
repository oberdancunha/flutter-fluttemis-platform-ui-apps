import '../core/platform.dart';

String getPlatformFontFamilyMono() {
  final currentPlatform = getCurrentPlatform();
  switch (currentPlatform) {
    case CurrentPlatform.isMacOS:
      return 'SF Mono';
    case CurrentPlatform.isWindows:
      return 'Segoe Mono';
    case CurrentPlatform.isLinux:
      return 'Ubuntu Mono';
  }
}

double getPlatformFontFamilyMonoSize() {
  final currentPlatform = getCurrentPlatform();
  switch (currentPlatform) {
    case CurrentPlatform.isMacOS:
      return 11;
    case CurrentPlatform.isWindows:
      return 11.5;
    case CurrentPlatform.isLinux:
      return 13;
  }
}
