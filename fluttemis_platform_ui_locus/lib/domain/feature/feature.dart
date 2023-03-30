import 'package:fluttemis_platform_ui_core/domain/value_objects.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../locus/location_position.dart';
import 'feature_product_type.dart';

class Feature extends Equatable {
  final UniqueIdValueObject id;
  final List<LocationPosition> positions;
  final int startToDraw;
  final int endToDraw;
  final String type;
  final StrandTypeValueObject strand;
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
    required this.positions,
    required this.startToDraw,
    required this.endToDraw,
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
        positions,
        startToDraw,
        endToDraw,
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
    int length = 0;
    positions.forEach((position) {
      length += position.start <= position.end ? (position.end - position.start) + 1 : 0;
    });

    return length;
  }
}
