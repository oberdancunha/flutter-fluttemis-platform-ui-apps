import '../core/platform_style.dart';

class PlatformFontFamilyMono extends PlatformStyle<String> {
  @override
  String getMacosStyle() => 'SF Mono';

  @override
  String getWindowsStyle() => 'Segoe Mono';

  @override
  String getMaterialStyle() => 'Ubuntu Mono';
}
