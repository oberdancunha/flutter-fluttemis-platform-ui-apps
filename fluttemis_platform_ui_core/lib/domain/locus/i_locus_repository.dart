import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../../domain/core/failures.dart';
import 'locus.dart';

abstract class ILocusRepository {
  Future<Either<Failure, KtList<Locus>>> getLocus();
}
