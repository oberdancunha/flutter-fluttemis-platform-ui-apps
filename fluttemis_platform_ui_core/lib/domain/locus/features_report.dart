import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import 'feature.dart';
import 'features_report_extension_functions.dart';

class FeaturesReport extends Equatable {
  final Map<String, List<Feature>> featuresTypesList;
  final Map<String, int> featuresTypesCount;
  final Map<String, int> featuresTypesProductsCount;

  factory FeaturesReport(List<Feature> features) => FeaturesReport._(
        featuresTypesList: getTypesList(features),
        featuresTypesCount: getTypesCount(features),
        featuresTypesProductsCount: getTypesProductsCount(features),
      );

  const FeaturesReport._({
    required this.featuresTypesList,
    required this.featuresTypesCount,
    required this.featuresTypesProductsCount,
  });

  @override
  List<Object?> get props => [
        featuresTypesList,
        featuresTypesCount,
        featuresTypesCount,
      ];
}
