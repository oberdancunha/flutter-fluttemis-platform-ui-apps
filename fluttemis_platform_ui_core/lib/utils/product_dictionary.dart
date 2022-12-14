import 'constants.dart';

Map<int, List<String>> productDictionary = {
  colorLocusFeatureHypotheticalProduct: [
    'hypothetical',
  ],
  colorLocusFeaturePutativeProduct: [
    'putative',
    'probable',
  ],
  colorLocusFeatureUnknownProduct: [
    'unknown',
    'uncharacterized',
  ],
};

Map<int, String> productDictionaryLabel = {
  colorLocusFeatureKnownProduct: 'Known',
  colorLocusFeatureHypotheticalProduct: 'Hypothetical',
  colorLocusFeaturePutativeProduct: 'Putative',
  colorLocusFeatureUnknownProduct: 'Uncharacterized',
  colorLocusFeatureNotProduct: 'Without',
};
