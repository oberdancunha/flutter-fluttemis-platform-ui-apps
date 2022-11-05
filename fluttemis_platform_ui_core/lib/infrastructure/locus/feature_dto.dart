import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../../domain/core/value_transformer.dart';
import '../../domain/locus/feature.dart';

class FeatureDto extends Equatable {
  final int start;
  final int end;
  final String type;
  final int strand;
  final String? typeByOverlap;
  final String? name;
  final String? product;
  final String? nucleotides;
  final String? aminoacids;
  final String? note;

  const FeatureDto({
    required this.start,
    required this.end,
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
        start,
        end,
        type,
        strand,
      ];

  Feature toDomain() => Feature(
        id: start.toString() + end.toString() + strand.toString() + type,
        start: start,
        end: end,
        strand: strand,
        type: type,
        typeByOverlap: typeByOverlap ?? type,
        aminoacids: aminoacids,
        nucleotides: nucleotides,
        name: name,
        note: note,
        product: product,
        color: colorLocusFeatureByProduct(product ?? ''),
        show: shouldDrawFeature(type),
      );

  FeatureDto copyWith({
    int? start,
    int? end,
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
        start: start ?? this.start,
        end: end ?? this.end,
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
