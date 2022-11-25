import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

abstract class FileFailure extends Equatable {}

class FileFailureNotFound extends FileFailure {
  @override
  List<Object?> get props => [];
}

class FileFailureParseError extends FileFailure {
  // ignore: no-object-declaration
  final Object error;

  FileFailureParseError({required this.error});

  @override
  List<Object?> get props => [error];
}

class FileFailureEmpty extends FileFailure {
  @override
  List<Object?> get props => [];
}

class FileFailureFormatIncorrect extends FileFailure {
  @override
  List<Object?> get props => [];
}
