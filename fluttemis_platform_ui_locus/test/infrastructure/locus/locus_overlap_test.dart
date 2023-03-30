import 'package:fluttemis_platform_ui_locus/infrastructure/locus/locus_overlap.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/genbank_dto_overlap.dart';

void main() {
  late LocusOverlap locusOverlap;
  final mockFeaturesOrder = getFeatureOrder();
  final mockReverseFeaturesOrder = getReverseFeaturesOrder();

  setUpAll(() {
    locusOverlap = LocusOverlap();
  });

  test(
    'Should separate locus overlaps into different identifiers',
    () {
      final locusOverlapsWithDifferentIdentifiers =
          locusOverlap.getFeaturesOverlapsDifferentIdentifiers(mockFeaturesOrder);
      expect(
        locusOverlapsWithDifferentIdentifiers,
        equals(mockReverseFeaturesOrder),
      );
    },
  );
}
