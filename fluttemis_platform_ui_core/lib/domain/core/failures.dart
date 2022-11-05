import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

abstract class Failure extends Equatable {}

class FailureFileNotFound extends Failure {
  @override
  List<Object?> get props => [];
}

class FailureFileParseError extends Failure {
  // ignore: no-object-declaration
  final Object error;

  FailureFileParseError({required this.error});

  @override
  List<Object?> get props => [error];
}

class FailureFileEmpty extends Failure {
  @override
  List<Object?> get props => [];
}

class FailureFileFormatIncorrect extends Failure {
  @override
  List<Object?> get props => [];
}
