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

  String get insertInnerWhiteSpace => replaceAllMapped('', (_) => ' ').trim();

  String get capitalizeFirstLetter => "${this[0].toUpperCase()}${substring(1)}";
}
