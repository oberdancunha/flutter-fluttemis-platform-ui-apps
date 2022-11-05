import 'package:fluttemis_platform_ui_dependency_module/fluttemis_platform_ui_dependency_module.dart';

import '../../domain/core/failures.dart';
import 'locus_dto.dart';

abstract class ILocusDataSource {
  Future<Either<Failure, List<LocusDto>>> getLocus();
}
