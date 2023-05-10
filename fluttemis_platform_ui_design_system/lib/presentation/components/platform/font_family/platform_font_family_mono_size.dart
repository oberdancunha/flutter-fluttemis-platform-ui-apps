import '../core/platform_style.dart';

class PlatformFontFamilyMonoSize extends PlatformStyle<double> {
  @override
  double getMacosStyle() => 11;

  @override
  double getWindowsStyle() => 11.5;

  @override
  double getMaterialStyle() => 13;
}
