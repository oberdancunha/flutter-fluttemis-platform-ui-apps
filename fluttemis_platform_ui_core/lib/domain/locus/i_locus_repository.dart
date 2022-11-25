import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../core/file_failures.dart';
import 'locus.dart';

abstract class ILocusRepository {
  Future<Either<FileFailure, KtList<Locus>>> getLocus();
}
