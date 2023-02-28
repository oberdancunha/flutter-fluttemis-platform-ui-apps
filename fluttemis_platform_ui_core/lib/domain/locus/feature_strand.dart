enum FeatureStrandType {
  upstream("5' -> 3' (+)"),
  downstream("3' -> 5' (-)");

  final String label;

  const FeatureStrandType(this.label);
}
