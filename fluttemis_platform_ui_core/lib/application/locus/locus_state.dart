import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../../domain/core/failures.dart';
import '../../domain/locus/locus.dart';

class LocusState extends Equatable {
  final KtList<Locus> locus;
  final bool isLoading;
  final Failure? failure;

  const LocusState({
    required this.locus,
    required this.isLoading,
    required this.failure,
  });

  factory LocusState.initial() => const LocusState(
        locus: KtList.empty(),
        isLoading: false,
        failure: null,
      );

  @override
  List<Object?> get props => [
        locus,
        isLoading,
        failure,
      ];

  LocusState copyWith({
    KtList<Locus>? locus,
    bool? isLoading,
    Failure? failure,
  }) =>
      LocusState(
        locus: locus ?? this.locus,
        isLoading: isLoading ?? this.isLoading,
        failure: failure ?? this.failure,
      );
}
