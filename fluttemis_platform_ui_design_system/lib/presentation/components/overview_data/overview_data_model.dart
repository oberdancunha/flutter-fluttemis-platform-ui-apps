import '../platform/text/text_style/platform_text_style.dart';

class OverviewDataModel {
  final String value;
  final String description;
  final String image;
  final PlatformTextStyle? textStyle;

  OverviewDataModel({
    required this.value,
    required this.description,
    required this.image,
    this.textStyle,
  });
}
