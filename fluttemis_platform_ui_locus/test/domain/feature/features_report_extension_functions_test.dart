import 'package:fluttemis_platform_ui_locus/domain/feature/feature.dart';
import 'package:fluttemis_platform_ui_locus/domain/feature/features_report_extension_functions.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/genbank_data.dart';

void main() {
  late List<Feature> features;

  setUpAll(() {
    features = getLocusFeatures().asList();
  });

  test(
    'Get features list separated by types',
    () {
      final mockFeaturesTypesList = getFeaturesByList();
      final featuresTypesList = getTypesList(features);
      expect(featuresTypesList, equals(mockFeaturesTypesList));
    },
  );

  test(
    'Get count of features list separated by types',
    () {
      final mockFeaturesTypesListCount = getFeaturesByTypesCount();
      final featuresTypesCount = getTypesCount(features);
      expect(featuresTypesCount, equals(mockFeaturesTypesListCount));
    },
  );

  test(
    'Get products count of features separated by types',
    () {
      final mockFeaturesByTypesProductsCount = getFeaturesByTypesProductsCount();
      final featuresTypesProductsCount = getFeaturesByTypesProductsCount();
      expect(featuresTypesProductsCount, equals(mockFeaturesByTypesProductsCount));
    },
  );
}
