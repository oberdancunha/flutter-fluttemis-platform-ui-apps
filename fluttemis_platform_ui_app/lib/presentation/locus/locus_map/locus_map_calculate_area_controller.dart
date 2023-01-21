class LocusMapCalculateAreaController {
  final double width;
  final double height;
  final int locusLength;
  final int minPixelsPerCharacter;

  const LocusMapCalculateAreaController({
    required this.width,
    required this.height,
    required this.locusLength,
    required this.minPixelsPerCharacter,
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
}
