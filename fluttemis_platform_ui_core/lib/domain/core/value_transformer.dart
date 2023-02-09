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

extension ValueTransformer on String {
  String get removeExcessiveWhiteSpaces => trim().replaceAll(RegExp(' +'), ' ');

  String get breakEvery60Characters => replaceAllMapped(
        RegExp(r'(\w{60})'),
        (match) => '${match[1]}\n',
      );

  String get removeBreaks => replaceAllMapped(RegExp(r'\n'), (_) => '');

  String get removeWhiteSpace => trim().replaceAll(' ', '');

  String get insertWhiteSpaceInside => replaceAllMapped('', (_) => ' ').trim();
}
