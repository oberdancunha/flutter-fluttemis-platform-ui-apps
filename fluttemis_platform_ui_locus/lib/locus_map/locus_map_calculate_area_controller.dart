class LocusMapCalculateAreaController {
  final double width;
  final double maxHeight;
  final int locusLength;
  final int minPixelsPerCharacter;
  final int featuresTypesListLength;
  final double minHeight;
  final int distanceBetweenLines;
  final double locusRulerHeight;

  const LocusMapCalculateAreaController({
    required this.width,
    required this.maxHeight,
    required this.locusLength,
    required this.minPixelsPerCharacter,
    required this.featuresTypesListLength,
    required this.minHeight,
    required this.distanceBetweenLines,
    required this.locusRulerHeight,
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

  int get totalFeaturesTypesHeight => featuresTypesListLength * distanceBetweenLines;

  double get mapHeight {
    final totalMapHeight = totalFeaturesTypesHeight + locusRulerHeight + minHeight;

    return totalMapHeight >= maxHeight
        ? maxHeight
        : totalMapHeight >= minHeight
            ? totalMapHeight
            : minHeight;
  }
}
