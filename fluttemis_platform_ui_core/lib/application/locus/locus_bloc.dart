import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../../domain/core/failures.dart';
import '../../domain/locus/i_locus_repository.dart';
import '../../domain/locus/locus.dart';

part 'locus_event.dart';
part 'locus_state.dart';

class LocusBloc extends Bloc<LocusEvent, LocusState> {
  final ILocusRepository locusRepository;

  LocusBloc({required this.locusRepository}) : super(LocusStateInitial()) {
    on<LocusEvent>(
      (locusEvent, emit) async {
        if (locusEvent is LocusEventGetLocus) {
          emit(LocusStateLoad());
          final locusOrFailure = await locusRepository.getLocus();
          emit(
            locusOrFailure.fold(
              LocusStateFailure.new,
              LocusStateSuccess.new,
            ),
          );

          return;
        }
      },
    );
  }
}
