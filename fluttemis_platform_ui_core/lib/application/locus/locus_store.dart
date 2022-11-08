import 'package:flutter/widgets.dart';

import '../../domain/locus/i_locus_repository.dart';
import 'locus_state.dart';

class LocusStore extends ValueNotifier<LocusState> {
  final ILocusRepository locusRepository;

  LocusStore({
    required this.locusRepository,
  }) : super(LocusState.initial());

  Future<void> getLocus() async {
    value = value.copyWith(
      isLoading: true,
    );
    final locusOrFailure = await locusRepository.getLocus();
    locusOrFailure.fold(
      (failure) => value = value.copyWith(
        isLoading: false,
        failure: failure,
      ),
      (locus) => value = value.copyWith(
        isLoading: false,
        locus: locus,
      ),
    );
  }
}
