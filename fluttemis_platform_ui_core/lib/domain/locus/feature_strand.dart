enum FeatureStrandType {
  upstream("5' -> 3' (+)", 0),
  downstream("3' -> 5' (-)", 1);

  final String label;
  final int fileRawData;

  const FeatureStrandType(this.label, this.fileRawData);
}
