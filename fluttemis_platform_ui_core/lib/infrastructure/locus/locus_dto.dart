import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../../domain/core/value_objects.dart';
import '../../domain/locus/features_report.dart';
import '../../domain/locus/locus.dart';
import 'feature_dto.dart';

class LocusDto extends Equatable {
  final String name;
  final int length;
  final String type;
  final String organism;
  final List<FeatureDto> features;
  final String? shape;
  final String? releaseDate;
  final String? sequence;

  const LocusDto({
    required this.name,
    required this.length,
    required this.type,
    required this.organism,
    required this.features,
    this.shape,
    this.releaseDate,
    this.sequence,
  });

  @override
  List<Object> get props => [
        name,
        length,
        type,
        organism,
        features,
      ];

  Locus toDomain() => Locus(
        id: UniqueIdValueObject(),
        name: name,
        length: length,
        organism: organism,
        type: type,
        shape: shape,
        releaseDate: releaseDate,
        sequence: sequence,
        features: features.map((feature) => feature.toDomain()).toImmutableList(),
        featuresReport: FeaturesReport(features.map((feature) => feature.toDomain()).toList()),
      );

  LocusDto copyWith({
    String? name,
    int? length,
    String? type,
    String? organism,
    List<FeatureDto>? features,
    String? shape,
    String? releaseDate,
    String? sequence,
  }) =>
      LocusDto(
        name: name ?? this.name,
        length: length ?? this.length,
        type: type ?? this.type,
        organism: organism ?? this.organism,
        features: features ?? this.features,
        shape: shape ?? this.shape,
        releaseDate: releaseDate ?? this.releaseDate,
        sequence: sequence ?? this.sequence,
      );
}
