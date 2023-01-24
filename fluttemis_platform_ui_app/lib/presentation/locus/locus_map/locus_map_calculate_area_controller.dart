class LocusMapCalculateAreaController {
  final double width;
  final double height;
  final int locusLength;
  final int minPixelsPerCharacter;
  final int featuresTypesListLength;

  const LocusMapCalculateAreaController({
    required this.width,
    required this.height,
    required this.locusLength,
    required this.minPixelsPerCharacter,
    required this.featuresTypesListLength,
  });

  int get locusLengthByCharacters => locusLength.toString().length;

  int get pixelsPerCharacter {
    int pixelsPerCharacter = ((locusLength / width) / locusLengthByCharacters).round();
    if (pixelsPerCharacter < minPixelsPerCharacter) {
      pixelsPerCharacter = minPixelsPerCharacter;
    }

    return pixelsPerCharacter;
  }

  double get scale => (width / locusLength) * (pixelsPerCharacter * (locusLengthByCharacters / 10));

  double get screenWidthScale => locusLength * scale;

  double get labelHeight => double.tryParse((featuresTypesListLength * 26).toString())!;
}
