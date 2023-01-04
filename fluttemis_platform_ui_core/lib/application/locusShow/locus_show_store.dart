import 'package:flutter/foundation.dart';

import '../../domain/locus/locus.dart';

class LocusShowStore extends ChangeNotifier {
  late Locus _locusToBeShown;

  set locusToBeShown(Locus locusChoosed) {
    _locusToBeShown = locusChoosed;
    notifyListeners();
  }

  Locus get locusToBeShown => _locusToBeShown;
}
