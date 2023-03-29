// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../../domain/core/value_objects.dart';
import '../../domain/core/value_transformer.dart';
import '../../domain/locus/feature.dart';
import '../../domain/locus/feature_product_type.dart';
import '../../domain/locus/feature_value_object.dart';
import '../../domain/locus/location_position.dart';

class FeatureDto extends Equatable {
  final List<LocationPosition> positions;
  final int startToDraw;
  final int endToDraw;
  final String type;
  final int strand;
  final String? typeByOverlap;
  final String? name;
  final String? product;
  final String? nucleotides;
  final String? aminoacids;
  final String? note;

  const FeatureDto({
    required this.positions,
    required this.startToDraw,
    required this.endToDraw,
    required this.type,
    required this.strand,
    this.typeByOverlap,
    this.name,
    this.product,
    this.nucleotides,
    this.aminoacids,
    this.note,
  });

  @override
  List<Object> get props => [
        positions,
        startToDraw,
        endToDraw,
        type,
        strand,
      ];

  Feature toDomain() => Feature(
        id: UniqueIdValueObject(),
        positions: positions
            .map(
              (position) => LocationPosition(
                start: position.start,
                end: position.end,
              ),
            )
            .toList(),
        startToDraw: startToDraw,
        endToDraw: endToDraw,
        strand: FeatureStrandTypeValueObject(strand),
        type: type,
        typeByOverlap: typeByOverlap ?? type,
        aminoacids: aminoacids,
        nucleotides: nucleotides,
        name: name,
        note: note,
        product: product,
        productType: FeatureProductType.detectTerm(product),
        show: shouldDrawFeature(type),
      );

  FeatureDto copyWith({
    List<LocationPosition>? positions,
    int? startToDraw,
    int? endToDraw,
    String? type,
    int? strand,
    String? typeByOverlap,
    String? name,
    String? product,
    String? nucleotides,
    String? aminoacids,
    String? note,
  }) =>
      FeatureDto(
        positions: positions ?? this.positions,
        startToDraw: startToDraw ?? this.startToDraw,
        endToDraw: endToDraw ?? this.endToDraw,
        type: type ?? this.type,
        strand: strand ?? this.strand,
        typeByOverlap: typeByOverlap ?? this.typeByOverlap,
        name: name ?? this.name,
        product: product ?? this.product,
        nucleotides: nucleotides ?? this.nucleotides,
        aminoacids: aminoacids ?? this.aminoacids,
        note: note ?? this.note,
      );
}
