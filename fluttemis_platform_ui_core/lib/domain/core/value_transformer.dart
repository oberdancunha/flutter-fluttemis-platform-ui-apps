import '../../utils/constants.dart';
import '../../utils/product_dictionary.dart';

int colorLocusFeatureByProduct(String product) {
  if (product.isEmpty) {
    return colorLocusFeatureNotProduct;
  }
  final productColor = productDictionary.keys.firstWhere(
    (termColor) => productDictionary[termColor]!
        .where(
          (term) => product.toLowerCase().contains(term),
        )
        .isNotEmpty,
    orElse: () => colorLocusFeatureKnownProduct,
  );

  return productColor;
}

bool shouldDrawFeature(String type) =>
    type.toLowerCase() != 'source' && type.toLowerCase() != 'gene' && type.toLowerCase() != 'mrna';

String removeExcessiveWhiteSpaces(String value) => value.trim().replaceAll(RegExp(' +'), ' ');

String breakSequencesEvery60Characters(String sequences) => sequences.replaceAllMapped(
      RegExp(r'(\w{60})'),
      (match) => '${match[1]}\n',
    );
