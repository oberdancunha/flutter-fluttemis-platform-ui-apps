enum FeatureProductType {
  known(
    color: 0xFF388E3C,
    terms: [],
  ),
  hypothetical(
    color: 0xFFF44336,
    terms: [
      'hypothetical',
    ],
  ),
  putative(
    color: 0xFFAB47BC,
    terms: [
      'putative',
      'probable',
    ],
  ),
  uncharacterized(
    color: 0xFF3F51B5,
    terms: [
      'unknown',
      'uncharacterized',
    ],
  ),
  truncated(
    color: 0xFFF9A825,
    terms: [
      'truncated',
    ],
  ),
  without(
    color: 0xFF909090,
    terms: [],
  );

  final int color;
  final List<String> terms;

  const FeatureProductType({
    required this.terms,
    required this.color,
  });

  factory FeatureProductType.detectTerm(String? product) {
    if (product == null || product.isEmpty) {
      return FeatureProductType.without;
    }

    return FeatureProductType.values.firstWhere(
      (productType) => productType.terms
          .where(
            (term) => product.toLowerCase().contains(term.toLowerCase()),
          )
          .isNotEmpty,
      orElse: () => FeatureProductType.known,
    );
  }
}
