import 'package:fluttemis_platform_ui_core/domain/value_objects.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../feature/feature.dart';
import '../feature/features_report.dart';

class Locus extends Equatable {
  final UniqueIdValueObject id;
  final String name;
  final int length;
  final String type;
  final String organism;
  final KtList<Feature> features;
  final FeaturesReport featuresReport;
  final String? shape;
  final DateTime? releaseDate;
  final String? sequence;

  const Locus({
    required this.id,
    required this.name,
    required this.length,
    required this.type,
    required this.organism,
    required this.features,
    required this.featuresReport,
    this.shape,
    this.releaseDate,
    this.sequence,
  });

  @override
  List<Object?> get props => [
        name,
        length,
        type,
        organism,
        features,
        featuresReport,
        shape,
        releaseDate,
        sequence,
      ];
}
