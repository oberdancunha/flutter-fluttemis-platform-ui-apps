import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

class FileFailure extends Union4Impl<_NotFound, _ParseError, _Empty, _FormatIncorrect> {
  static const _factory = Quartet<_NotFound, _ParseError, _Empty, _FormatIncorrect>();

  FileFailure._(super.union);

  factory FileFailure.notFound() => FileFailure._(_factory.first(_NotFound()));

  factory FileFailure.parseError(error) => FileFailure._(_factory.second(_ParseError(error)));

  factory FileFailure.empty() => FileFailure._(_factory.third(_Empty()));

  factory FileFailure.formatIncorrect() => FileFailure._(_factory.fourth(_FormatIncorrect()));
}

class _NotFound extends Equatable {
  @override
  List<Object?> get props => [];
}

class _ParseError extends Equatable {
  final dynamic error;

  const _ParseError(this.error);

  @override
  List<Object?> get props => [error];
}

class _Empty extends Equatable {
  @override
  List<Object?> get props => [];
}

class _FormatIncorrect extends Equatable {
  @override
  List<Object?> get props => [];
}
