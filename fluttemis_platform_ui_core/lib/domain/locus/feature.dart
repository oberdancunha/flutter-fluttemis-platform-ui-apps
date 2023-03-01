import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../core/value_objects.dart';
import 'feature_product_type.dart';
import 'feature_value_object.dart';

class Feature extends Equatable {
  final UniqueIdValueObject id;
  final int start;
  final int end;
  final String type;
  final FeatureStrandTypeValueObject strand;
  final FeatureProductType productType;
  final bool show;
  final String typeByOverlap;
  final String? name;
  final String? product;
  final String? nucleotides;
  final String? aminoacids;
  final String? note;

  const Feature({
    required this.id,
    required this.start,
    required this.end,
    required this.type,
    required this.strand,
    required this.productType,
    required this.show,
    required this.typeByOverlap,
    this.name,
    this.product,
    this.nucleotides,
    this.aminoacids,
    this.note,
  });

  @override
  List<Object?> get props => [
        start,
        end,
        type,
        strand,
        productType,
        show,
        typeByOverlap,
        name,
        product,
        nucleotides,
        aminoacids,
        note,
      ];

  int get length {
    if (end < start) {
      return 0;
    }

    return (end - start) + 1;
  }
}
