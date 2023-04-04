import 'package:fluttemis_platform_ui_core/domain/failure.dart';
import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../../domain/locus/locus.dart';

class LocusState extends Union4Impl<_Initial, _Loading, _Success, _Failure> {
  static const _factory = Quartet<_Initial, _Loading, _Success, _Failure>();

  LocusState._(super.union);

  factory LocusState.initial() => LocusState._(_factory.first(_Initial()));

  factory LocusState.loading() => LocusState._(_factory.second(_Loading()));

  factory LocusState.success(KtList<Locus> locus) => LocusState._(_factory.third(_Success(locus)));

  factory LocusState.failure(Failure failure) => LocusState._(_factory.fourth(_Failure(failure)));
}

class _Initial extends Equatable {
  @override
  List<Object?> get props => [];
}

class _Loading extends Equatable {
  @override
  List<Object?> get props => [];
}

class _Success extends Equatable {
  final KtList<Locus> locus;

  const _Success(this.locus);

  @override
  List<Object?> get props => [locus];
}

class _Failure extends Equatable {
  final Failure message;

  const _Failure(this.message);

  @override
  List<Object?> get props => [message];
}
