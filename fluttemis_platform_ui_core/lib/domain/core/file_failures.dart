import 'failure.dart';

abstract class FileFailure extends Failure {}

class FileFailureNotFound extends FileFailure {
  @override
  List<Object?> get props => [];
}

class FileFailureParseError extends FileFailure {
  final dynamic error;

  FileFailureParseError({required this.error});

  @override
  List<Object?> get props => [error];

  @override
  bool get tryAgain => true;
}

class FileFailureEmpty extends FileFailure {
  @override
  List<Object?> get props => [];
}

class FileFailureFormatIncorrect extends FileFailure {
  @override
  List<Object?> get props => [];
}
