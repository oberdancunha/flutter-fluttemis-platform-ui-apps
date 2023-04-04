import 'package:flutter/widgets.dart';

import '../../domain/locus/i_locus_repository.dart';
import 'locus_state.dart';

class LocusStore extends ValueNotifier<LocusState> {
  final ILocusRepository locusRepository;

  LocusStore({
    required this.locusRepository,
  }) : super(LocusState.initial());

  Future<void> getLocus() async {
    value = LocusState.loading();
    final locusOrFailure = await locusRepository.getLocus();
    locusOrFailure.fold(
      (failure) => value = LocusState.failure(failure),
      (locus) => value = LocusState.success(locus),
    );
  }
}
