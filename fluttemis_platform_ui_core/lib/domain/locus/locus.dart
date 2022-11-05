import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import 'feature.dart';
import 'features_report.dart';

class Locus extends Equatable {
  final String name;
  final int length;
  final String type;
  final String organism;
  final KtList<Feature> features;
  final FeaturesReport featuresReport;
  final String? shape;
  final String? releaseDate;
  final String? sequence;

  const Locus({
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
