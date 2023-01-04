import 'package:fluttemis_platform_ui_core/application/locusShow/locus_show_store.dart';
import 'package:fluttemis_platform_ui_core/domain/locus/locus.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../data/genbank_data.dart';

void main() {
  late LocusShowStore locusShowStore;
  late Locus locusToBeShown;

  setUpAll(() {
    locusShowStore = LocusShowStore();
    locusToBeShown = getLocus().get(0);
  });

  test('Should set a locus to be shown', () {
    locusShowStore
      ..addListener(() {
        expect(locusShowStore.locusToBeShown, isNotNull);
        expect(locusShowStore.locusToBeShown, equals(locusToBeShown));
      })
      ..locusToBeShown = locusToBeShown;
  });
}
