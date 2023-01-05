import '../platform/text/text_type_enum.dart';

class OverviewDataModel {
  final String value;
  final String description;
  final String image;
  final TextType? textType;

  OverviewDataModel({
    required this.value,
    required this.description,
    required this.image,
    this.textType,
  });
}
