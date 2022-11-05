part of 'locus_bloc.dart';

abstract class LocusState extends Equatable {}

class LocusStateInitial extends LocusState {
  @override
  List<Object?> get props => [];
}

class LocusStateLoad extends LocusState {
  @override
  List<Object?> get props => [];
}

class LocusStateSuccess extends LocusState {
  final KtList<Locus> locus;

  LocusStateSuccess(this.locus);

  @override
  List<Object?> get props => [locus];
}

class LocusStateFailure extends LocusState {
  final Failure failure;

  LocusStateFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}
