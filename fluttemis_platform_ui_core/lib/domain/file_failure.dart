import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

class FileFailure
    extends Union5Impl<_NotFound, _ParseError, _Empty, _FormatIncorrect, _FormatDataIncorrect> {
  static const _factory =
      Quintet<_NotFound, _ParseError, _Empty, _FormatIncorrect, _FormatDataIncorrect>();

  FileFailure._(super.union);

  factory FileFailure.notFound() => FileFailure._(_factory.first(_NotFound()));

  factory FileFailure.parseError(error) => FileFailure._(_factory.second(_ParseError(error)));

  factory FileFailure.empty() => FileFailure._(_factory.third(_Empty()));

  factory FileFailure.formatIncorrect() => FileFailure._(_factory.fourth(_FormatIncorrect()));

  factory FileFailure.formatDataIncorrect() => FileFailure._(
        _factory.fifth(_FormatDataIncorrect()),
      );
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

class _FormatDataIncorrect extends Equatable {
  @override
  List<Object?> get props => [];
}
