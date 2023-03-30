enum StrandType {
  upstream("5' -> 3' (+)"),
  downstream("3' -> 5' (-)");

  final String label;

  const StrandType(this.label);
}
