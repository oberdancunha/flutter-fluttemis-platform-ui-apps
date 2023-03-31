import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import 'file_failure.dart';

class Failure extends Union1Impl<_File> {
  static const _factory = Singlet<_File>();

  Failure._(super.union);

  factory Failure.file(FileFailure failure) => Failure._(_factory.first(_File(failure)));
}

class _File extends Equatable {
  final FileFailure failure;

  const _File(this.failure);

  @override
  List<Object?> get props => [failure];
}
