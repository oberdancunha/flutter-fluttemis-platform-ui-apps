import 'package:fluttemis_platform_ui_core/domain/locus/feature_product_type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  FeatureProductType detectTerm(String? product) => FeatureProductType.detectTerm(product);

  test('Should detect a KNOWN product', () {
    const product = "cell division protein DrpB";
    final featureProductType = detectTerm(product);
    expect(featureProductType, isA<FeatureProductType>());
    expect(featureProductType, equals(FeatureProductType.known));
  });

  test('Should detect a HYPOTHETICAL product', () {
    const product = "hypothetical protein";
    final featureProductType = detectTerm(product);
    expect(featureProductType, isA<FeatureProductType>());
    expect(featureProductType, equals(FeatureProductType.hypothetical));
  });

  test('Should detect a PUTATIVE through the putative product', () {
    const product = "putative cation transport regulator ChaB";
    final featureProductType = detectTerm(product);
    expect(featureProductType, isA<FeatureProductType>());
    expect(featureProductType, equals(FeatureProductType.putative));
  });

  test('Should detect a PUTATIVE through the probable product', () {
    const product = "probable cation transport regulator ChaB";
    final featureProductType = detectTerm(product);
    expect(featureProductType, isA<FeatureProductType>());
    expect(featureProductType, equals(FeatureProductType.putative));
  });

  test('Should detect an UNCHARACTERIZED through the uncharacterized product', () {
    const product = "radical uncharacterized SAM protein";
    final featureProductType = detectTerm(product);
    expect(featureProductType, isA<FeatureProductType>());
    expect(featureProductType, equals(FeatureProductType.uncharacterized));
  });

  test('Should detect an UNCHARACTERIZED through the unknown product', () {
    const product = "radical unknown SAM protein";
    final featureProductType = detectTerm(product);
    expect(featureProductType, isA<FeatureProductType>());
    expect(featureProductType, equals(FeatureProductType.uncharacterized));
  });

  test('Should detect a TRUNCATED product', () {
    const product = "truncated gag-pol fusion protein";
    final featureProductType = detectTerm(product);
    expect(featureProductType, isA<FeatureProductType>());
    expect(featureProductType, equals(FeatureProductType.truncated));
  });

  test('Should detect WITHOUT when product is empty', () {
    const product = "";
    final featureProductType = detectTerm(product);
    expect(featureProductType, isA<FeatureProductType>());
    expect(featureProductType, equals(FeatureProductType.without));
  });

  test('Should detect WITHOUT when product is null', () {
    const String? product = null;
    final featureProductType = detectTerm(product);
    expect(featureProductType, isA<FeatureProductType>());
    expect(featureProductType, equals(FeatureProductType.without));
  });
}
