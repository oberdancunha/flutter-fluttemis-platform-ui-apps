import 'package:fluttemis_platform_ui_locus/domain/feature/feature.dart';
import 'package:fluttemis_platform_ui_locus/domain/feature/features_report.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/genbank_data.dart';

void main() {
  late List<Feature> features;
  late FeaturesReport featuresReport;

  setUpAll(() {
    features = getLocusFeatures().asList();
    featuresReport = FeaturesReport(features);
  });

  test(
    'Get features list separated by types',
    () {
      final mockFeaturesTypesList = getFeaturesByList();
      expect(featuresReport.featuresTypesList, equals(mockFeaturesTypesList));
    },
  );

  test(
    'Get count of features list separated by types',
    () {
      final mockFeaturesTypesListCount = getFeaturesByTypesCount();
      expect(featuresReport.featuresTypesCount, equals(mockFeaturesTypesListCount));
    },
  );

  test(
    'Get products count of features separated by types',
    () {
      final mockFeaturesByTypesProductsCount = getFeaturesByTypesProductsCount();
      expect(featuresReport.featuresTypesProductsCount, equals(mockFeaturesByTypesProductsCount));
    },
  );
}
